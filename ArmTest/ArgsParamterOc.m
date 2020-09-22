//
//  ArgsParamterOc.m
//  ArmTest
//
//  Created by fanyin on 2020/9/22.
//

#import "ArgsParamterOc.h"

@implementation ArgsParamterOc



+ (int)sum:(int)num, ...
{
	int result = num;
	int objNum;
	
	va_list arg_list;
	va_start(arg_list, num);
	while ((objNum = va_arg(arg_list, int))) {
		result += objNum;
	}
	va_end(arg_list);
	return result;
}

@end
