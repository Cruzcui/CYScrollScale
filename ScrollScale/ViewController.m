//
//  ViewController.m
//  ScrollScale
//
//  Created by ishang on 14/11/2.
//  Copyright (c) 2014年 commondec. All rights reserved.
//

#import "ViewController.h"
#import "ScrollScale.h"

@interface ViewController ()<ScaleDelegate> {
    UILabel * label;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    ScrollScale * scale = [[ScrollScale alloc] initWithFrame:CGRectMake(60, 100, 200, 100)];
    [scale setBackgroundColor:[UIColor lightGrayColor]];
    
    [scale setDelegate:self];
    [self.view addSubview:scale];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 40, 40)];
    [label setTextColor:[UIColor blackColor]]   ;
    [self.view addSubview:label];
}
//
-(void)returnNumber:(CGFloat)Num {
    label.text =[NSString stringWithFormat:@"%.1f",Num];
}


-(NSInteger)getMax {
    return 10;
}
-(NSInteger)getMin {
    return 0;
}
-(CGFloat)getCurrent {
    return 5.5;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
