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
	[b4 setTitle:@"three" forState:UIControlStateNormal];
	[b4 addTarget:self action:@selector(onclickFour) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:b4];
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

@end
