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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	
//	self.view.backgroundColor = UIColor.redColor;
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


static int a = 0x1234;
static int b = 0x2334;
static int c = 0x3234;
static int d = 0x4234;

///BP 在那里
- (void)onclickSix
{
	argsTest(a,b);
}

- (void)onclickSeven
{
	argsTest(a,b,c,d);
}

@end
