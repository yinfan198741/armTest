//
//  ViewController.m
//  ArmTest
//
//  Created by fanyin on 2020/9/20.
//

#import "ViewController.h"
#include "addTow.h"
#include "addThree.h"
#include "addFour.h"
#include "BigStruct.h"
#include "ArgsParamter.h"
#import "ArgsParamterOc.h"
#import "HPerson.h"
#import "THInterceptor.h"
#import <objc/runtime.h>



@interface TestObject : NSObject
@end

@implementation TestObject

- (void)method
{
	NSLog(@"123 cmd = %s",_cmd);
}

@end

@interface ViewController ()

@end

extern int TestAss(void);

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	
//	self.view.backgroundColor = UIColor.redColor;
	
	UIButton* b1 = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
	b1.backgroundColor = [UIColor redColor];
	[b1 setTitle:@"one" forState:UIControlStateNormal];
	[b1 addTarget:self action:@selector(onclickOne) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:b1];
	
	UIButton* b2 = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, 50, 50)];
	b2.backgroundColor = [UIColor redColor];
	[b2 setTitle:@"tow" forState:UIControlStateNormal];
	[b2 addTarget:self action:@selector(onclickTow) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:b2];
	
	
	UIButton* b3 = [[UIButton alloc] initWithFrame:CGRectMake(10, 300, 50, 50)];
	b3.backgroundColor = [UIColor redColor];
	[b3 setTitle:@"three" forState:UIControlStateNormal];
	[b3 addTarget:self action:@selector(onclickThree) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:b3];
	
	
	UIButton* b4 = [[UIButton alloc] initWithFrame:CGRectMake(10, 200, 50, 50)];
	b4.backgroundColor = [UIColor redColor];
	[b4 setTitle:@"Four" forState:UIControlStateNormal];
	[b4 addTarget:self action:@selector(onclickFour) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:b4];
	
	
	UIButton* b5 = [[UIButton alloc] initWithFrame:CGRectMake(200, 100, 50, 50)];
	b5.backgroundColor = [UIColor redColor];
	[b5 setTitle:@"Five" forState:UIControlStateNormal];
	[b5 addTarget:self action:@selector(onclickFive) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:b5];
	
	
	UIButton* b6 = [[UIButton alloc] initWithFrame:CGRectMake(200, 200, 50, 50)];
	b6.backgroundColor = [UIColor redColor];
	[b6 setTitle:@"Six" forState:UIControlStateNormal];
	[b6 addTarget:self action:@selector(onclickSix) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:b6];
	
	
	UIButton* b7 = [[UIButton alloc] initWithFrame:CGRectMake(200, 300, 50, 50)];
	b7.backgroundColor = [UIColor redColor];
	[b7 setTitle:@"Seven" forState:UIControlStateNormal];
	[b7 addTarget:self action:@selector(onclickSeven) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:b7];
	
	
	UIButton* b8 = [[UIButton alloc] initWithFrame:CGRectMake(100, 400, 50, 50)];
	b8.backgroundColor = [UIColor redColor];
	[b8 setTitle:@"Eight" forState:UIControlStateNormal];
	[b8 addTarget:self action:@selector(onclickOne1) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:b8];
	
	
	UIButton* b9 = [[UIButton alloc] initWithFrame:CGRectMake(200, 400, 50, 50)];
	b9.backgroundColor = [UIColor redColor];
	[b9 setTitle:@"Nine" forState:UIControlStateNormal];
	[b9 addTarget:self action:@selector(onclickOne2) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:b9];
	
	
	UIButton* b0 = [[UIButton alloc] initWithFrame:CGRectMake(100, 500, 50, 50)];
	b0.backgroundColor = [UIColor redColor];
	[b0 setTitle:@"Ten" forState:UIControlStateNormal];
	[b0 addTarget:self action:@selector(Ten) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:b0];
}

// C Format
void myInterceptor()
{
	// bla bla bla
	
	NSLog(@"myInterceptor");
}




- (void)onclickOne
{
//	long a = 0x1111;
//	long b = 0x2222;
//	long tow = addTow(a, b);
//	NSLog(@"tow = %ld",tow);

<<<<<<< HEAD
//	int ret = TestAss();
//	NSLog(@"ret = %d",ret);
=======
//	myInterceptor();
	int ret = 0;//TestAss();
	NSLog(@"ret = %d",ret);
	
	
//	THInterceptor *interceptor = [[THInterceptor alloc] initWithRedirectionFunction:(IMP)myInterceptor];
//	Method m = class_getInstanceMethod([HPerson class], @selector(eat));
//	IMP imp = method_getImplementation(m);
//
//	// Intercept the imp
//	THInterceptorResult *result = [interceptor interceptFunction:imp];
//
//	// You can check the result.state to find whether the inteception is successfully carried out or not.
//	if (result.state == THInterceptStateSuccess)
//	{
//		NSLog(@"THInterceptStateSuccess");
//	}
//	HPerson* hp = [[HPerson alloc] init];
//	[hp eat];
	
	
	THInterceptor *interceptor = [[THInterceptor alloc] initWithRedirectionFunction:(IMP)myInterceptor];

	// Suppose you want to intercept the call of - [UIView initWithFrame:]
	Method m = class_getInstanceMethod([UIView class], @selector(initWithFrame:));
	IMP imp = method_getImplementation(m);

	// Intercept the imp
	THInterceptorResult *result = [interceptor interceptFunction:imp];

	// You can check the result.state to find whether the inteception is successfully carried out or not.
	if (result.state == THInterceptStateSuccess)
	{
		NSLog(@"THInterceptStateSuccess");
	}
	
>>>>>>> 56100569cdeda8eecb2a7ad62460fd90eb5bc51d
}

- (void)onclickTow
{
	
//	HPerson* hp = [[HPerson alloc] init];a
//	[hp eat];
	long a = 0x1111;
	long b = 0x2222;
	long tow = addTow(a, b);
	NSLog(@"tow = %ld",tow);
}


- (void)onclickThree
{
	long a = 0x1234;
	long b = 0x2334;
	long c = 0x3234;
	long three = addThree(a, b, c);
	NSLog(@"three = %ld",three);
}

- (void)onclickFour
{
	long a = 0x1234;
	long b = 0x2334;
	long c = 0x3234;
	long d = 0x4234;
	long three = addFour(a, b, c,d);
	NSLog(@"three = %ld",three);
}


- (void)onclickFive
{
	bigs s = getBigs();
	NSLog(@"s.a19 = %lld",s.a19);
}


//static int a = 1;
//static int b = 2;
//static int c = 3;
//static int d = 4;


int sum(int argnum, ...)
{
	va_list arguments;
	int i;
	int sum = 0;

	va_start(arguments, argnum); /* Needs last known character to calculate
							   the address of the other parameters */
	for(i = 0; i < argnum; ++i)
		sum += va_arg(arguments, int); /* use next argument */

	va_end(arguments);

	return sum;
}
///BP 在那里
- (void)onclickSix
{
//	sum(5, 5, 7, 1, 3, -2);
//	int ret = argsTest(1,2);
//	printf("%d",ret);
//	int a = 0x1234;
//	[ArgsParamterOc sum: @(1111) , @(2222), nil];
	
	int ret = sum(1,2,3);
	printf("%d",ret);
}

- (void)onclickSeven
{
//	int ret = argsTest(1,2,3,4);
//	printf("%d",ret);
//	int a = 0x1234;
//	[ArgsParamterOc sum: @(1) , @2, @3, @4, nil];
	
	int ret = sum(1,2,3,4,5);
	printf("%d",ret);
}



- (void)onclickOne1
{
//	UIView* v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
	NSLog(@"v = %@",@"onclickOne");
//	[_obj method];
	TestObject* __obj = [[TestObject alloc] init];
	[__obj method];
}


// 拦截函数
void wzq_check_variadic(id a, char * methodName, int *v, ...)
{
	NSLog(@"haha checked %@ %s", a, methodName);
}


- (void)onclickOne2
{

	
	THInterceptor *sharedInterceptor = [[THInterceptor alloc] initWithRedirectionFunction:(IMP)wzq_check_variadic];

	Method m = class_getInstanceMethod([TestObject class], @selector(method));
	IMP imp = method_getImplementation(m);

	THInterceptorResult *result = [sharedInterceptor interceptFunction:(IMP)imp];
	if (result.state == THInterceptStateSuccess) {
		method_setImplementation(m, (IMP)result.replacedAddress);
		NSLog(@"%p",result.replacedAddress);
	}

	
	
}


- (void)Ten
{
	
	int a = TestAss();
	NSLog(@"Ten %d",a);
}


@end
