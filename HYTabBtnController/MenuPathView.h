//
//  MenuPathView.h
//  HYTabBtnController
//
//  Created by 胡杨 on 16/3/2.
//  Copyright © 2016年 Hoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuButton : UIButton

@property (nonatomic, assign) CGFloat Xvalue;
@property (nonatomic, assign) CGFloat Yvalue;
@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, assign) CGPoint endPoint;

@end


typedef NS_ENUM(NSInteger, MenuType) {
    MenuTypeOne = 0,
    MenuTypeTwo,
    MenuTypeThree,
    MenuTypeFour,
    MenuTypeFive
};

typedef void(^RetBlock)(MenuType type);


@interface MenuPathView : UIView

- (void)hide;
- (void)show;

@end
