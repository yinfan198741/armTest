//
//  ArgsParamterOc.m
//  ArmTest
//
//  Created by fanyin on 2020/9/22.
//

#import "ArgsParamterOc.h"

@implementation ArgsParamterOc



+ (long)sum:(long)num, ...
{
	long result = num;
//	long objNum;
	
	va_list arg_list;
	va_start(arg_list, num);
	
	for (int i = 0 ; i < num; i++) {
		result += va_arg(arg_list, long);
	}
	
//	while ((objNum = va_arg(arg_list, long))) {
//		result += objNum;
//	}
	va_end(arg_list);
	return result;
}

@end
