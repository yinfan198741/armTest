//
//  ArgsParamter.c
//  ArmTest
//
//  Created by fanyin on 2020/9/22.
//

#include "ArgsParamter.h"
#include <stdarg.h>
#include <stdio.h>

void argsTest(long n, ...)
{
	va_list ap;
	va_start(ap,n);
	long temp = 0;
	for (int i = 0 ; i < n; i++) {
		temp = va_arg(ap, long);
	}
	va_end(ap);
}
