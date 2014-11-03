//
//  ScrollScale.h
//  ScrollScale
//
//  Created by ishang on 14/11/2.
//  Copyright (c) 2014年 commondec. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SubScroll.h"
@protocol ScaleDelegate <NSObject>
-(NSInteger) getMin;
-(NSInteger) getMax;
-(CGFloat) getCurrent;
-(void)returnNumber:(CGFloat)num;
@end
@interface ScrollScale : UIView<returnNumber>
@property (nonatomic, assign)id<ScaleDelegate>delegate;
@property (nonatomic)SubScroll * backScroll;

@end
