//
//  ViewController.m
//  AppOne
//
//  Created by icity on 2017/6/23.
//  Copyright © 2017年 icity. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, self.view.frame.size.width, 40)];
    label.text = @"AppOne";
    label.textColor = [UIColor redColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    UIButton *jumpBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 150, 50)];
    [jumpBtn setTitle:@"app跳转" forState:UIControlStateNormal];
    [jumpBtn setBackgroundColor:[UIColor greenColor]];
    [jumpBtn addTarget:self action:@selector(jumpClick) forControlEvents:UIControlEventTouchUpInside];
    jumpBtn.center = self.view.center;
    [self.view addSubview:jumpBtn];
}

- (void)jumpClick
{
    NSURL *url = [NSURL URLWithString:@"testAppTwo://?token=123&name=zhangsan"];
    if ([UIDevice currentDevice].systemVersion.doubleValue >= 10.0) {
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
            if (success) {
                NSLog(@"jump apptwo success");
            }
        }];
    } else {
        if ([[UIApplication sharedApplication] canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:url];
        }
    }
}


@end
