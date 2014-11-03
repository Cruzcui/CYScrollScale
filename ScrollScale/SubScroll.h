//
//  SubScroll.h
//  ScrollScale
//
//  Created by ishang on 14/11/2.
//  Copyright (c) 2014年 commondec. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol returnNumber <NSObject>
-(void)getScaleNumber:(CGFloat)Num;
@end


@interface SubScroll : UIScrollView<UIScrollViewDelegate,UIScrollViewAccessibilityDelegate>
@property (nonatomic, assign) NSInteger minNumber;
@property (nonatomic, assign) NSInteger maxNumber;
@property (nonatomic, assign) CGFloat currentNumber;
@property (nonatomic, assign) id<returnNumber>NumberDelegate;
@property (nonatomic, assign) CGFloat NewP;
@property (nonatomic, assign) CGFloat OldP;
-(instancetype) initWithFrame:(CGRect)frame andMaxNumber:(NSInteger)maxNumber andMinNumber:(NSInteger)minNumber andCurrentNumber:(CGFloat)curNumber;
@end
