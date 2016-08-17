//
//  SiftView.m
//  SiftDemo
//
//  Created by 程勇 on 16/8/10.
//  Copyright © 2016年 com.lq.t. All rights reserved.
//

#import "SiftView.h"
#import "SiftListView.h"

#define kCOLOR_RED [UIColor colorWithRed:225/255.0 green:38/255.0 blue:63/255.0 alpha:1]
#define KCOLOR_GRAY_LINEOME [UIColor colorWithRed:139/255.0f green:139/255.0f blue:139/255.0f alpha:1]

@interface SiftView()

@property (strong, nonatomic) NSMutableArray *dataArray;
@property (strong, nonatomic) UIView *cover;
@property (assign, nonatomic) CGFloat height;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet UIButton *btnOne;
@property (weak, nonatomic) IBOutlet UIButton *btnTwo;

@end

@implementation SiftView

- (IBAction)clickButtonEventOne:(UIButton *)senderOne {

    [self.btnOne setImage:[UIImage imageNamed:@"ico_tab_arrows_pre"] forState:UIControlStateSelected];
    [self.btnOne setTitleColor:kCOLOR_RED forState:UIControlStateSelected];
    [self.btnOne setImage:[UIImage imageNamed:@"ico_tab_arrows"] forState:UIControlStateNormal];
    [self.btnOne setTitleColor:KCOLOR_GRAY_LINEOME forState:UIControlStateNormal];
    
    senderOne.selected = !senderOne.selected;
    if (senderOne.selected) {//
        if (self.btnTwo.selected) {
            [self dismissList];
            self.btnTwo.selected = NO;
        }
        [self addCoverWithSuperView];
        [SiftListView showSiftTableViewInSuperView:self
                                        dataSource:_dataArray
                                   clickCompletion:^(NSInteger index) {
                                       NSLog(@"%lu", index);
                                   }];
    } else {
        [self dismissList];
    }
	
    return;
}

- (IBAction)clickButtonSecond:(UIButton *)senderTwo {
    
    [senderTwo setImage:[UIImage imageNamed:@"ico_tab_arrows_pre"] forState:UIControlStateSelected];
    [senderTwo setTitleColor:kCOLOR_RED forState:UIControlStateSelected];
    [senderTwo setImage:[UIImage imageNamed:@"ico_tab_arrows"] forState:UIControlStateNormal];
    [senderTwo setTitleColor:KCOLOR_GRAY_LINEOME forState:UIControlStateNormal];

    senderTwo.selected = !senderTwo.selected;
	
	__weak SiftView *weakSelf = self;
    if (senderTwo.selected) {
        if (self.btnOne.selected) {
            [self dismissList];
            self.btnOne.selected = NO;
        }
        [self addCoverWithSuperView];
        [SiftListView showSiftTableViewInSuperView:self
                                        dataSource:_dataArray
                                   clickCompletion:^(NSInteger index) {
                                       NSLog(@"%lu", index);
									   
									   weakSelf.clickCompletion(index);
                                   }];
    } else {
        [self dismissList];
    }
	
}

#pragma mark - 收下拉框
- (void) dismissList {
	__weak SiftView *weakSelf = self;
	for (UIView *subview in [[self superview] subviews]) {
		if ([subview isMemberOfClass:[SiftListView class]]) {
			SiftListView *list = (SiftListView *)subview;
            [weakSelf removeCoverFromSuperView];
			[UIView animateWithDuration:0 animations:^{
				list.frame = CGRectMake(0, -300, self.frame.size.width, 300);
    
			} completion:^(BOOL finished) {
				
				if (finished) {
                    [list removeFromSuperview];
				}
			}];
		}
	}
}

- (void)tapCover:(UITapGestureRecognizer *)recognizer {
    self.btnOne.selected = NO;
    self.btnTwo.selected = NO;
    [self dismissList];
}

+ (void) showSiftInSuperView:(UIView *)superView
				  dataSource:(NSMutableArray *)array
			 clickCompletion:(ClickCompletion)clickCompletion {
	SiftView *sift = [[[NSBundle mainBundle] loadNibNamed:@"SiftView"
													owner:self
												  options:nil] lastObject];
	sift.frame = CGRectMake(0, 64, superView.frame.size.width, 40);
	[superView addSubview:sift];
	sift.dataArray = array;
	sift.backgroundColor = [UIColor redColor];
	sift.height = superView.frame.size.height;
	sift.clickCompletion = clickCompletion;
	
}

-(void) addCoverWithSuperView {
	[[self superview] addSubview:self.cover];
	self.cover.backgroundColor = [UIColor blackColor];
	self.cover.alpha = 0.4;
	_cover.tag = 10000;
	UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(tapCover:)];
	tap.numberOfTapsRequired = 1.0;
	[self.cover addGestureRecognizer:tap];
}

- (void) removeCoverFromSuperView {
	if (self.cover) {
		[self.cover removeFromSuperview];
	}
	_line.hidden = NO;
}
- (UIView *)cover {
	if (!_cover) {
		_cover = [[UIView alloc] initWithFrame:CGRectMake(0, 60, self.frame.size.width, _height)];
	}
	
	return _cover;
}

@end
