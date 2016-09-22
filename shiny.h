//
//  shiny.h
//  shinyBtn--抛光效果的按钮
//
//  Created by mac on 16/9/22.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface shiny : UIButton
//  属性的声明
@property(strong,nonatomic)UIColor *myColor;
//  方法的声明
- (id)initWithFrame:(CGRect)frame withBackgroundColor:(UIColor *)backgroundColor;

- (void)wasPressed;
- (void)endedPress;
- (void)makeButtonShiny:(shiny *)button withBackgroundColor:(UIColor *)backgroundColor;
@end
