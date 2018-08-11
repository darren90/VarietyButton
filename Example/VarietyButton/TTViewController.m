//
//  TTViewController.m
//  VarietyButton
//
//  Created by 1005052145@qq.com on 08/11/2018.
//  Copyright (c) 2018 1005052145@qq.com. All rights reserved.
//

#import "TTViewController.h"
#import "TTIndicatorButton.h"

@interface TTViewController ()

@end

@implementation TTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    TTIndicatorButton *btn = [TTIndicatorButton new];
    btn.frame = CGRectMake(100, 100, 200, 50);
    [btn setTitle:@"确认" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundColor:[UIColor colorWithRed:255 / 255.0 green:102 / 255.0 blue:51 / 255.0 alpha:1.0] forState:UIControlStateNormal];
    [self.view addSubview:btn];
}

- (void)btnAction:(TTIndicatorButton *)btn {
    btn.indicatorType = TTIndicatorButtonAnimating;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        btn.indicatorType = TTIndicatorButtonNone;
    });
}

@end
