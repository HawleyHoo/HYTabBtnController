//
//  MenuPathView.h
//  HYTabBtnController
//
//  Created by 胡杨 on 16/3/2.
//  Copyright © 2016年 Hoo. All rights reserved.
//

#import <UIKit/UIKit.h>

#define WEAKSELF    typeof(self)        __weak      weakSelf = self;
#define STRONGSELF  typeof(weakSelf)    __strong    strongSelf = weakSelf;

@interface MenuButton : UIButton

@property (nonatomic, assign) CGFloat Xvalue;
@property (nonatomic, assign) CGFloat Yvalue;
@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, assign) CGPoint endPoint;

@end

#define KImageItems @"home_more_normal",@"home_statistics_normal",@"home_calendar_normal",@"home_product_normal",@"home_test_normal"
#define KPressImage @"home_more_press",@"home_statistics_press",@"home_calendar_press",@"home_product_press",@"home_test_press"

typedef NS_ENUM(NSInteger, MenuType) {
    MenuTypeOne = 0,
    MenuTypeTwo,
    MenuTypeThree,
    MenuTypeFour,
    MenuTypeFive
};

typedef void(^RetBlock)(MenuType type);


@interface MenuPathView : UIView

@property (nonatomic, assign) BOOL isExpanding;

- (void)performBlock:(RetBlock)block;

- (void)hide;
- (void)show;

@end
