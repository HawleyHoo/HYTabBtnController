//
//  MenuPathView.m
//  HYTabBtnController
//
//  Created by 胡杨 on 16/3/2.
//  Copyright © 2016年 Hoo. All rights reserved.
//

#import "MenuPathView.h"

#define kWidth  [[UIScreen mainScreen]bounds].size.width
#define kHeight [[UIScreen mainScreen]bounds].size.height

@interface MenuPathView ()

@property (nonatomic, weak) UIButton    *menuButton;

@property (nonatomic, weak) UIImageView *menuBgView;

@property (nonatomic, weak) UIImageView *normalBgView;


@end


@implementation MenuPathView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
