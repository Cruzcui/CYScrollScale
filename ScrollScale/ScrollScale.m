//
//  ScrollScale.m
//  ScrollScale
//
//  Created by ishang on 14/11/2.
//  Copyright (c) 2014年 commondec. All rights reserved.
//

#import "ScrollScale.h"
#import "Const.h"
@implementation ScrollScale
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    
    //添加滚动视图
    _backScroll = [[SubScroll alloc] initWithFrame:rect andMaxNumber:[_delegate getMax]  andMinNumber:[_delegate getMin] andCurrentNumber:[_delegate getCurrent]];
    [_backScroll setNumberDelegate:self];
    [self addSubview:_backScroll];
    [self setBackgroundColor:[UIColor blueColor]];
    
    UIView * lineView = [[UIView alloc] initWithFrame:CGRectMake(self.bounds.size.width/2, self.bounds.origin.y, 1, self.bounds.size.height)];
    [lineView setBackgroundColor:[UIColor blackColor]];
    [self addSubview:lineView];
    
    


}
-(void)getScaleNumber:(CGFloat)Num {
    NSLog(@"%.1f****",Num / (STEP*10));
    [_delegate returnNumber:Num / (STEP*10)];
}

@end
