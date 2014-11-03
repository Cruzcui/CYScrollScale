//
//  ScaleView.m
//  ScrollScale
//
//  Created by ishang on 14/11/2.
//  Copyright (c) 2014年 commondec. All rights reserved.
//

#import "ScaleView.h"
#import "Const.h"
@implementation ScaleView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setFrame:frame];
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0);
    for (int i = 0; i <(self.max-self.min)*10 + 1 ; i ++) {
        
        CGContextSetLineWidth(context, 1.0);
        CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
        CGContextMoveToPoint(context, self.supFrame.size.width/2 + STEP * i, self.supFrame.origin.y);
        if (i%10 == 0) {
            
           CGContextAddLineToPoint(context, self.supFrame.size.width/2 + STEP * i, self.supFrame.size.height/4 * 3 );
            UIFont  *font = [UIFont boldSystemFontOfSize:16.0];
           [[NSString stringWithFormat:@"%d",i / 10] drawInRect:CGRectMake(self.supFrame.size.width/2 + STEP * i - 10, self.supFrame.size.height/4 * 3, 40, 10) withFont:font];
          
        }if (i%5 == 0 && i%10 != 0) {
            
            CGContextAddLineToPoint(context, self.supFrame.size.width/2 + STEP * i, self.supFrame.size.height/2 );
            UIFont  *font = [UIFont boldSystemFontOfSize:13.0];
            [[NSString stringWithFormat:@"%.1f",i/10.0] drawInRect:CGRectMake(self.supFrame.size.width/2 + STEP * i - 10, self.supFrame.size.height/2, 40, 10) withFont:font];

        }else {
                 
            CGContextAddLineToPoint(context, self.supFrame.size.width/2 + STEP * i, self.supFrame.size.height/4 * 1 );

        }
        
       
        
        
    }
    CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextStrokePath(context);

//    CGContextSetLineWidth(context, 1.0);
//    CGContextSetRGBFillColor (context, 0.5, 0.5, 0.5, 0.5);
    
}

@end
