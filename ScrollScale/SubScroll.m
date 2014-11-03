//
//  SubScroll.m
//  ScrollScale
//
//  Created by ishang on 14/11/2.
//  Copyright (c) 2014年 commondec. All rights reserved.
//

#import "SubScroll.h"
#import "ScaleView.h"
#import "Const.h"
@implementation SubScroll

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setFrame:frame];
        [self setBackgroundColor:[UIColor clearColor]];
        [self setDelegate:self];
    
           }
    return self;
}
-(instancetype) initWithFrame:(CGRect)frame andMaxNumber:(NSInteger)maxNumber andMinNumber:(NSInteger)minNumber andCurrentNumber:(CGFloat)curNumber{
    self.minNumber = minNumber;
    self.maxNumber = maxNumber;
    self.currentNumber = curNumber;
    return [self initWithFrame:frame];
    
}

- (void)drawRect:(CGRect)rect {
    
    [self setContentSize:CGSizeMake((self.maxNumber-self.minNumber)*STEP*10 + self.frame.size.width, self.frame.size.height)];
    ScaleView * scaleView = [[ScaleView alloc] initWithFrame:CGRectMake(0, 0, (self.maxNumber-self.minNumber)*STEP*10 + self.frame.size.width, self.frame.size.height)];
    self.showsHorizontalScrollIndicator = NO;
    self.bounces = NO;
   
  
    scaleView.max = self.maxNumber;
    scaleView.min = self.minNumber;
    scaleView.supFrame = self.frame;
    [self addSubview:scaleView];
    if (self.currentNumber > self.minNumber && self.currentNumber < self.maxNumber) {
        [self setContentOffset:CGPointMake(STEP * 10 *(self.currentNumber - self.minNumber), 0) animated:YES];
    }
    
    
    [_NumberDelegate getScaleNumber:self.contentOffset.x];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
     //NSLog(@"%d", (int)self.contentOffset.x);
    [_NumberDelegate getScaleNumber:self.contentOffset.x];
    
    
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    self.OldP = self.contentOffset.x;
}


-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    self.NewP = self.contentOffset.x;
    if (!self.decelerating) {
        [self setContentOffset:CGPointMake((((int)self.contentOffset.x + STEP/2)/STEP)*STEP, 0) animated:YES];//步长／2这个是判断位置
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
 [self setContentOffset:CGPointMake((((int)self.contentOffset.x + STEP/2)/STEP)*STEP, 0) animated:YES];

}



@end
