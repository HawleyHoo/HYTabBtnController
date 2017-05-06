//
//  RootViewController.m
//  HYTabBtnController
//
//  Created by 胡杨 on 16/3/2.
//  Copyright © 2016年 Hoo. All rights reserved.
//

#import "RootViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"
#import "MenuPathView.h"



@interface RootViewController ()

@property (nonatomic, weak) MenuPathView *pathView;

@property (nonatomic, strong) UINavigationController *navigationController;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupView];
    
}

- (void)setupView {
    
    
    OneViewController *vc1 = [[OneViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:vc1];
    self.navigationController = navigationController;
    [self addChildViewController:navigationController];
    [self.view addSubview:navigationController.view];
    
    MenuPathView *pathView = [[MenuPathView alloc] initWithFrame:self.view.bounds];
    self.pathView = pathView;
    
    WEAKSELF;
    [pathView performBlock:^(MenuType type) {
        [weakSelf switchViewController:type];
    }];
    [self.view addSubview:pathView];
    
}


- (void)switchViewController:(MenuType)type {
    switch (type)
    {
        case MenuTypeOne:
        {
            [self popToHomePageViewController];
        }
            break;
        case MenuTypeTwo:
        {
            [self pushToViewControllerOfClass:[TwoViewController class]];
        }
            break;
        case MenuTypeThree:
        {
            [self pushToViewControllerOfClass:[TwoViewController class]];
        }
            break;
        case MenuTypeFour:
        {
            [self pushToViewControllerOfClass:[FourViewController class]];
        }
            break;
        case MenuTypeFive:
        {
            [self pushToViewControllerOfClass:[FiveViewController class]];
        }
            break;
        default:
            break;
    }
}

- (void)popToHomePageViewController {
    UIViewController *viewController = [_navigationController visibleViewController];
    NSArray *tmpArray = [_navigationController viewControllers];
    UIViewController *homePageController = (UIViewController*)[tmpArray firstObject];
    if ( ![viewController isKindOfClass:[BaseViewController class]] )
    {
        if ([viewController isKindOfClass:[OneViewController class]])
        {
            [_navigationController popToViewController:homePageController animated:YES];
        }
        else
        {
            if (tmpArray.count >= 2)
            {
                UIViewController *viewController = tmpArray[1];
                if ([viewController isKindOfClass:[OneViewController class]])
                {
                    [_navigationController popToViewController:viewController animated:YES];
                }
                else
                {
                    [_navigationController popToViewController:homePageController animated:YES];
                }
            }
            else
            {
                [_navigationController popToViewController:homePageController animated:YES];
            }
        }
    }
}


- (void)pushToViewControllerOfClass:(Class)className {
    UIViewController *viewController = [_navigationController visibleViewController];
    if ( [viewController isKindOfClass:className] )
    {
        return;
    }
    NSArray *tmpArray = [_navigationController viewControllers];
    for (UIViewController *viewController in tmpArray)
    {
        if ( [viewController isKindOfClass:className] )
        {
            [_navigationController popToViewController:viewController animated:YES];
            return;
        }
    }
    
    if ( ![viewController isKindOfClass:className] )
    {
        NSLog(@" %@", className);
        UIViewController *viewController = [[className alloc] init];
        [self.navigationController pushViewController:viewController animated:YES];
//        UIViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass(className)];
//        [_navigationController pushViewController:viewController animated:YES];
        viewController = nil;
    }
}


@end
