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
	
	UIButton* b2 = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, 100, 100)];
	b2.backgroundColor = [UIColor redColor];
	[b2 setTitle:@"tow" forState:UIControlStateNormal];
	[b2 addTarget:self action:@selector(onclickTow) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:b2];
	
	
	UIButton* b3 = [[UIButton alloc] initWithFrame:CGRectMake(10, 300, 100, 100)];
	b3.backgroundColor = [UIColor redColor];
	[b3 setTitle:@"three" forState:UIControlStateNormal];
	[b3 addTarget:self action:@selector(onclickThree) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:b3];
	
	
	UIButton* b4 = [[UIButton alloc] initWithFrame:CGRectMake(10, 500, 100, 100)];
	b4.backgroundColor = [UIColor redColor];
	[b4 setTitle:@"Four" forState:UIControlStateNormal];
	[b4 addTarget:self action:@selector(onclickFour) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:b4];
	
	
	UIButton* b5 = [[UIButton alloc] initWithFrame:CGRectMake(200, 100, 100, 100)];
	b5.backgroundColor = [UIColor redColor];
	[b5 setTitle:@"Five" forState:UIControlStateNormal];
	[b5 addTarget:self action:@selector(onclickFive) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:b5];
	
	
	UIButton* b6 = [[UIButton alloc] initWithFrame:CGRectMake(200, 300, 100, 100)];
	b6.backgroundColor = [UIColor redColor];
	[b6 setTitle:@"Six" forState:UIControlStateNormal];
	[b6 addTarget:self action:@selector(onclickSix) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:b6];
	
	
	UIButton* b7 = [[UIButton alloc] initWithFrame:CGRectMake(200, 500, 100, 100)];
	b7.backgroundColor = [UIColor redColor];
	[b7 setTitle:@"Seven" forState:UIControlStateNormal];
	[b7 addTarget:self action:@selector(onclickSeven) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:b7];
	
	
}

- (void)onclickOne
{
//	long a = 0x1111;
//	long b = 0x2222;
//	long tow = addTow(a, b);
//	NSLog(@"tow = %ld",tow);

	int ret = TestAss();
	NSLog(@"ret = %d",ret);
}

- (void)onclickTow
{
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


		

@end
