//
//  ArgsParamter.c
//  ArmTest
//
//  Created by fanyin on 2020/9/22.
//

#include "ArgsParamter.h"
#include "stdarg.h"

int argsTest(int argnum, ...)
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
	
//	int sum = 0;
//	int i;
//	va_list ap;
//	va_start(ap, count);
//	for (i = 0; i < count; ++i)
//	{
//		sum += va_arg(ap, int);
//	}
//	va_end(ap);
//	printf("%d",sum);
	
	

//	 va_list list;
//	 va_start(list, arg);
//	 int ret = arg;
//	  int ab ;
//	while((ab = va_arg(list, int))) {
//		 ret += ab;
//	 }
//	 va_end(list);
//	 return ret;
	
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




