//
//  SiftListView.m
//  SiftDemo
//
//  Created by 程勇 on 16/8/10.
//  Copyright © 2016年 com.lq.t. All rights reserved.
//

#import "SiftListView.h"

@interface SiftListView ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *list;
@property (assign, nonatomic) BOOL exchange;
@end
@implementation SiftListView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)awakeFromNib {
    _list.delegate  =self;
    _list.dataSource = self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *ID = [NSString stringWithFormat:@"cell%lu", indexPath.row];
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    cell.textLabel.text = [_dataArray objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (_clickListCompletion) {
		_clickListCompletion(indexPath.row);
	}
	[self dismiss];
}

+ (void) showSiftTableViewInSuperView:(UIView *)superView
						   dataSource:(NSMutableArray *)dataArray
					  clickCompletion:(ClickListCompletion)clickListCompletion {
	
    SiftListView *list = [[[NSBundle mainBundle] loadNibNamed:@"SiftListView"
                                                        owner:self
		
                                                      options:nil] lastObject];
    list.dataArray = dataArray;
	list.frame = CGRectMake(0, -200, superView.frame.size.width, dataArray.count * 44);
	
	[[superView superview] addSubview:list];
	[[superView superview] bringSubviewToFront:superView];
	
	[UIView animateWithDuration:0.3 animations:^{
		list.frame = CGRectMake(0, 100, superView.frame.size.width, dataArray.count * 44);
	}];
	list.clickListCompletion = clickListCompletion;
}

- (void) dismiss {
	
	__weak SiftListView *weakSelf = self;
	[UIView animateWithDuration:0 animations:^{
		weakSelf.frame = CGRectMake(0, -300, weakSelf.frame.size.width, 300);
		
	} completion:^(BOOL finished) {
		
		if (finished) {
			for (UIView *subview in [[weakSelf superview] subviews]) {
				if (subview.tag == 10000) {
					[subview removeFromSuperview];
				}
			}
			
			[weakSelf removeFromSuperview];
		}
	}];
}
@end
