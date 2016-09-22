//
//  shiny.m
//  shinyBtn
//
//  Created by mac on 16/9/22.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "shiny.h"

@implementation shiny
/*
 * 初始化
 */
- (id)initWithFrame:(CGRect)frame withBackgroundColor:(UIColor *)backgroundColor
{
          self = [super initWithFrame:frame];
    if (self) {
        self.myColor = backgroundColor;
        [self makeButtonShiny:self withBackgroundColor:backgroundColor];
        [self addTarget:self action:@selector(wasPressed) forControlEvents:UIControlEventTouchDown ]; //  添加动作
        [self addTarget:self action:@selector(endedPress) forControlEvents:UIControlEventTouchDown ]; //  添加动作
    }
       return self;
}
/*
 * 抛光
 */
- (void)makeButtonShiny:(shiny *)button withBackgroundColor:(UIColor *)backgroundColor
{
    CALayer *layer = button.layer;
    layer.cornerRadius = 8.0f;                 //  圆角
    layer.masksToBounds = YES;
    layer.borderWidth = 2.0f;
    layer.borderColor = [UIColor colorWithWhite:0.4f alpha:0.2f].CGColor;
    CAGradientLayer *shineLayer = [CAGradientLayer layer];   //   图层倾斜
    shineLayer.frame = button.layer.bounds;
    
    //  抛光的颜色
    shineLayer.colors = [NSArray arrayWithObjects:
                         (id)[UIColor colorWithWhite:1.0f alpha:0.4f].CGColor,
                         (id)[UIColor colorWithWhite:1.0f alpha:0.2f].CGColor,
                         (id)[UIColor colorWithWhite:0.75f alpha:0.2f].CGColor,
                         (id)[UIColor colorWithWhite:0.4f alpha:0.2f].CGColor,
                         (id)[UIColor colorWithWhite:1.0f alpha:0.4f].CGColor,
                         nil];
    //  抛光位置
    shineLayer.locations = [NSArray arrayWithObjects:
                            [NSNumber numberWithFloat:0.0f],
                            [NSNumber numberWithFloat:0.5f],
                            [NSNumber numberWithFloat:0.5f],
                            [NSNumber numberWithFloat:0.8f],
                            [NSNumber numberWithFloat:1.0f],
                            nil];
    
    
    [button.layer addSublayer:shineLayer];    //   为按钮添加图层
    
    [button setBackgroundColor:backgroundColor];
}

-(void)wasPressed{

    UIColor *newColor;
    CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha = 0.0, white = 0.0;

    if([self.myColor respondsToSelector:@selector(getRed:green:blue:alpha:)]) {
        [self.myColor getRed:&red green:&green blue:&blue alpha:&alpha];
        [self.myColor getWhite:&white alpha:&alpha];
        
        if(!(red + green + blue) && white){
            
            newColor = [UIColor colorWithWhite:white - 0.2 alpha:alpha];
        } else if(!(red + green + blue) && !white) {
            
            newColor = [UIColor colorWithWhite:white + 0.2 alpha:alpha];
        } else{
            
            newColor = [UIColor colorWithRed:red - 0.2 green:green - 0.2 blue:blue - 0.2 alpha:alpha];
        }
    }
    self.backgroundColor = newColor;

}

-(void)endedPress
{
    
    self.backgroundColor = self.myColor;
}
@end
