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



@implementation MenuButton


@end

@interface MenuPathView ()<UIAlertViewDelegate>

@property (nonatomic, weak) UIButton    *menuButton;

@property (nonatomic, weak) UIImageView *menuBgView;

@property (nonatomic, weak) UIImageView *normalBgImageView;

@property (nonatomic, copy) RetBlock retBlock;


@end


@implementation MenuPathView

- (void)performBlock:(RetBlock)block {
    self.retBlock = block;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blueColor];
        
        UIImage *menuBgImage = [UIImage imageNamed:@"home_menu_bg_image"];
        UIImageView *menuBgView = [[UIImageView alloc] initWithImage:menuBgImage];
        self.menuBgView = menuBgView;
        [menuBgView setFrame:CGRectMake( frame.size.width*0.5 - 60, frame.size.height, 120, 81.5)];
        [self addSubview:menuBgView];
        
        UIImage *menuBgImage1 = [UIImage imageNamed:@"home_menu_bg_image1"];
        UIImageView *normalBgImageView = [[UIImageView alloc]initWithImage:menuBgImage1];
        self.normalBgImageView = normalBgImageView;
        [normalBgImageView setFrame:CGRectMake( frame.size.width*0.5 - 87*0.5,frame.size.height - 65 , 87, 65)];
        [self addSubview:normalBgImageView];
        
        
        UIImage *menuImage = [UIImage imageNamed:@"home_menu_image"];
        UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.menuButton = menuButton;
        [menuButton setFrame:CGRectMake( frame.size.width*0.5 - 35,frame.size.height - 56 , 70, 70)];
        [menuButton setBackgroundImage:menuImage forState:UIControlStateNormal];
        [menuButton addTarget:self action:@selector(menuButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:menuButton];
        
        [self initItemButtons];
    }
    return self;
}

- (void)initItemButtons {
    CGPoint startPoint = CGPointMake(kWidth * 0.5, self.frame.size.height - 21);
    CGFloat radius = 70;
    
    NSArray *imageArray = [NSArray arrayWithObjects:KImageItems, nil];
    NSArray *pressImageArray = [NSArray arrayWithObjects:KPressImage, nil];
    for (int i = 0; i < 5; i++) {
        CGFloat centerX = self.frame.size.width*0.5 + radius*cosf(i * M_PI /4);
        CGFloat centerY = self.frame.size.height - radius*sinf(i * M_PI /4) -21.5;
        
        CGPoint endPoint = CGPointMake(centerX, centerY);
        
        NSString *imageName = [imageArray objectAtIndex:i];
        UIImage *image = [UIImage imageNamed:imageName];
        
        NSString *pressImageName = [pressImageArray objectAtIndex:i];
        UIImage *pressImage =[ UIImage imageNamed:pressImageName];
        
        MenuButton *button = [MenuButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:image forState:UIControlStateNormal];
        [button setBackgroundImage:pressImage forState:UIControlStateHighlighted];
        [button setFrame:CGRectMake(0, 0, 40, 40)];
        [button setTag:i+10000];
        [button setStartPoint:startPoint];
        [button setEndPoint:endPoint];
        [button setCenter:startPoint];
        [button setHidden:YES];
        [button addTarget:self action:@selector(vcareMenuButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self insertSubview:button belowSubview:_menuButton];
    }
}

- (void)hide {
    [UIView animateWithDuration:0.35 animations:^{
        self.normalBgImageView.transform = CGAffineTransformMakeTranslation(0, 90);
        self.menuButton.transform = CGAffineTransformMakeTranslation(0, 90);
        for (int i = 0; i < 5; i++)
        {
            MenuButton *button = (MenuButton *)[self viewWithTag:i+10000];
            button.transform = CGAffineTransformMakeTranslation(0, 90);
        }
    } completion:^(BOOL finished) {
        
    }];
}

- (void)show {
    [UIView animateWithDuration:0.35 animations:^{
        self.normalBgImageView.transform = CGAffineTransformIdentity;
        self.menuButton.transform = CGAffineTransformIdentity;
        for (int i = 0; i < 5; i++)
        {
            MenuButton *button = (MenuButton *)[self viewWithTag:i+10000];
            button.transform = CGAffineTransformIdentity;
        }
    } completion:^(BOOL finished) {
        
    }];
}

- (void)expandButtons {
    
    for (int i = 0; i < 5; i++)
    {
        MenuButton *button = (MenuButton*)[self viewWithTag:i+10000];
        [button setCenter:button.endPoint];
    }
}

- (void)closeButtons
{
    for (int i = 0; i < 5; i++)
    {
        MenuButton *button = (MenuButton*)[self viewWithTag:i+10000];
        [button setCenter:button.startPoint];
    }
}

- (void)moveIn
{
    self.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.4];
    for (int i = 0; i < 5; i++)
    {
        MenuButton *button = (MenuButton*)[self viewWithTag:i+10000];
        button.hidden = NO;
    }
    _normalBgImageView.hidden = YES;
    [UIView animateWithDuration:0.20 animations:^{
        
        CGRect menuBtnFrame = _menuButton.frame;
        menuBtnFrame.origin.y -= 10;
        _menuButton.frame = menuBtnFrame;
        
        CGRect menuBgFrame = _menuBgView.frame;
        menuBgFrame.origin.y -= 81.5;
        _menuBgView.frame = menuBgFrame;
        
        [self expandButtons];
        
    } completion:^(BOOL finished)
     {
         
     }];
}

- (void)moveOut:(void(^)(BOOL finished))block
{
    
    [UIView animateWithDuration:0.20 animations:^{
        
        CGRect menuBtnFrame = _menuButton.frame;
        menuBtnFrame.origin.y += 10;
        _menuButton.frame = menuBtnFrame;
        
        CGRect menuBgFrame = _menuBgView.frame;
        menuBgFrame.origin.y += 81.5;
        _menuBgView.frame = menuBgFrame;
        
        [self closeButtons];
        _normalBgImageView.hidden = NO;
        
    } completion:^(BOOL finished)
     {
         for (int i = 0; i < 5; i++)
         {
             MenuButton *button = (MenuButton*)[self viewWithTag:i+10000];
             button.hidden = YES;
         }
         self.backgroundColor = [UIColor clearColor];
         if (block)
         {
             block(finished);
         }
     }];
}



- (void)menuButtonClick:(id)sender
{
    _isExpanding = ! _isExpanding;
    
    if (_isExpanding)
    {
        [self moveIn];
    }
    else
    {
        [self moveOut:nil];
    }
    
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    if (_isExpanding)
    {
        return YES;
    }
    else
    {
        return CGRectContainsPoint(self.menuButton.frame, point);
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ( _isExpanding )
    {
        _isExpanding = NO;
        [self moveOut:nil];
    }
}

- (void)vcareMenuButtonClick:(id)sender
{
    UIButton *button = (UIButton*)sender;
    
    _isExpanding = NO;
    [self moveOut:^(BOOL finished) {
        if (finished)
        {
            if (self.retBlock)
            {
                self.retBlock(button.tag - 10000);
            }
        }
    }];
    
    
}


@end
