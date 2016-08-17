//
//  ViewController.m
//  SiftDemo
//
//  Created by 程勇 on 16/8/10.
//  Copyright © 2016年 com.lq.t. All rights reserved.
//

#import "ViewController.h"
#import "SiftView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.view.backgroundColor = [UIColor grayColor];
	NSMutableArray* dataArray = [NSMutableArray arrayWithObjects:@"1", @"2", @"3", @"4", nil];
	
//	[SiftView showSiftInSuperView:self.view dataSource:dataArray clickCompletion:^{
//		NSLog(@"click sift");
//	}];
//	
	[SiftView showSiftInSuperView:self.view dataSource:dataArray clickCompletion:^(NSInteger index) {
		NSLog(@"%lu", index);
	}];
    
    
    


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
