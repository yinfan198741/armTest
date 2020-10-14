//
//  HookMsgSend.m
//  ArmTest
//
//  Created by fanyin on 2020/10/14.
//



#import "objc_msgSend_hook.h"
#import "fishhook.h"
#include <dispatch/dispatch.h>
 
#define call(value) \
__asm volatile ("stp x8, x9, [sp, #-16]!\n"); \
__asm volatile ("mov x12, %0\n" :: "r"(value)); \
__asm volatile ("ldp x8, x9, [sp], #16\n"); \
__asm volatile ("blr x12\n");
 
#define save() \
__asm volatile ( \
"stp x8, x9, [sp, #-16]!\n" \
"stp x6, x7, [sp, #-16]!\n" \
"stp x4, x5, [sp, #-16]!\n" \
"stp x2, x3, [sp, #-16]!\n" \
"stp x0, x1, [sp, #-16]!\n");
 
#define load() \
__asm volatile ( \
"ldp x0, x1, [sp], #16\n" \
"ldp x2, x3, [sp], #16\n" \
"ldp x4, x5, [sp], #16\n" \
"ldp x6, x7, [sp], #16\n" \
"ldp x8, x9, [sp], #16\n" );
 
__unused static id (*orig_objc_msgSend)(id, SEL, ...);
 
uintptr_t l_ptr_t[10000];
int cur = 0;
 
void pre_objc_msgSend(id self, SEL _cmd, uintptr_t lr) {
	printf("pre action...\n");
  // 做一个简单对测试，输出 ObjC 方法名
  printf("\t%s\n", object_getClassName(self));
	printf("\t%s\n", _cmd);
	l_ptr_t[cur ++] = lr;
}
 
uintptr_t post_objc_msgSend() {
	printf("post action...\n");
	if (cur != 0) {
		cur --;
	}
	return l_ptr_t[cur];
}
 
__attribute__((__naked__))
static void hook_Objc_msgSend() {
	// 记录上下文
	save()
	
	// 将 lr 传入 x2 用于 pre_objc_msgSend 传参
	__asm volatile ("mov x2, lr\n");
 
	// 调用 pre_objc_msgSend
	call(&pre_objc_msgSend)
 
	// 还原上下文
	load()
	
	// 调用 objc_msgSend 原方法
	call(orig_objc_msgSend)
	
	// 记录上下文
	save()
	
	// 调用 post_objc_msgSend
	call(&post_objc_msgSend)
	
	// 还原 lr
	__asm volatile ("mov lr, x0\n");
	
	// 还原上下文
	load()
	
	// return
	__asm volatile ("ret\n");
}
 
#pragma mark public
 
// 启动Hook 入口
void hookStart() {
	static dispatch_once_t onceToken;
 
	dispatch_once(&onceToken, ^{
		rebind_symbols((struct rebinding[6]){
			{
	   "objc_msgSend",
	   (void *)hook_Objc_msgSend,
	   (void **)&orig_objc_msgSend
	  },
		}, 1);
	});
}
