//
//  ViewController.m
//  ArmTest
//
//  Created by fanyin on 2020/9/20.
//

#import "ViewController.h"
#include "addTow.h"
#include "addThree.h"

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
	
}
- (void)onclickTow
{
	int a = 0x1111;
	int b = 0x2222;
	int tow = addTow(a, b);
	NSLog(@"tow = %d",tow);
}


- (void)onclickThree
{
	int a = 0x1234;
	int b = 0x2234;
	int c = 0x3234;
	int three = addThree(a, b, c);
	NSLog(@"three = %d",three);
}

@end
