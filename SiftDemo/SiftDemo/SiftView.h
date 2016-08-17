//
//  SiftView.h
//  SiftDemo
//
//  Created by 程勇 on 16/8/10.
//  Copyright © 2016年 com.lq.t. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ClickCompletion) (NSInteger index);
@interface SiftView : UIView

+ (void) showSiftInSuperView:(UIView *)superView
				  dataSource:(NSMutableArray *)array
			 clickCompletion:(ClickCompletion)clickCompletion;
@property (copy, nonatomic) ClickCompletion clickCompletion;
@end
