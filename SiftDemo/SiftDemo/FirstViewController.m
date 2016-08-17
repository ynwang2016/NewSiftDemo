//
//  FirstViewController.m
//  SiftDemo
//
//  Created by ynwang on 16/8/11.
//  Copyright © 2016年 com.lq.t. All rights reserved.
//

#import "FirstViewController.h"
#import "SiftView.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.view.backgroundColor = [UIColor whiteColor];
	NSMutableArray* dataArray = [NSMutableArray arrayWithObjects:@"累计投资", @"即将到期", @"邀请人数", @"客户等级", nil];
	
	[SiftView showSiftInSuperView:self.view dataSource:dataArray clickCompletion:^(NSInteger index) {
		NSLog(@"%lu", index);
	}];
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
