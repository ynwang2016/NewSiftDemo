//
//  SiftListView.h
//  SiftDemo
//
//  Created by 程勇 on 16/8/10.
//  Copyright © 2016年 com.lq.t. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ClickListCompletion)(NSInteger index);
@interface SiftListView : UIView

+ (void) showSiftTableViewInSuperView:(UIView *)superView
						   dataSource:(NSMutableArray *)dataArray
                      clickCompletion:(ClickListCompletion)clickListCompletion;

@property (strong, nonatomic) NSMutableArray *dataArray;
@property (copy, nonatomic)ClickListCompletion clickListCompletion;

@end
