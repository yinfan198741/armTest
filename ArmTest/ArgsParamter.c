//
//  ArgsParamter.c
//  ArmTest
//
//  Created by fanyin on 2020/9/22.
//

#include "ArgsParamter.h"
#include <stdarg.h>
#include <stdio.h>

void __cdecl argsTest(int count, ...)
{
	//	va_list ap;
	//	va_start(ap,n);
	//	int temp = 0;
	//	int count = 0;
	//	for (int i = 0 ; i < n; i++) {
	//		temp = va_arg(ap, int);
	//		count = count + temp;
	//	}
	//	va_end(ap);
	//	printf("count = %d",temp);
	
	int sum = 0;
	int i;
	va_list ap;
	va_start(ap, count);
	for (i = 0; i < count; ++i)
	{
		sum += va_arg(ap, int);
	}
	va_end(ap);
	printf("%d",sum);
}
