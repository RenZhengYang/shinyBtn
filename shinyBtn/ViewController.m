//
//  ViewController.m
//  shinyBtn
//
//  Created by mac on 16/9/22.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"
#import "shiny.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //   实现橘色效果的抛光按钮
    CGRect rect1  = CGRectMake(120, 252, 100, 60);
    shiny *shinyBtn1 = [[shiny alloc]initWithFrame:rect1 withBackgroundColor:[UIColor orangeColor]];
    [shinyBtn1 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    //   实现红色效果的抛光按钮
    CGRect rect2  = CGRectMake(100, 100, 150, 50);
    shiny *shinyBtn2= [[shiny alloc]initWithFrame:rect2 withBackgroundColor:[UIColor redColor]];
    
     //  添加在View上
    [self.view addSubview:shinyBtn1];
    [self.view addSubview:shinyBtn2];
}

- (void)click:(UIButton *)btn{
    NSLog(@"橘色");
}
@end
