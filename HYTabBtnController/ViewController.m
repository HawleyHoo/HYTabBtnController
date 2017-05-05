//
//  ViewController.m
//  HYTabBtnController
//
//  Created by 胡杨 on 16/3/2.
//  Copyright © 2016年 Hoo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, copy) NSString *str1;

@property (nonatomic, strong) NSString *str2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *string = @"123";
    
    self.str1 = string;
    self.str2 = string;
    
    NSLog(@" %p %@", string, string);
    NSLog(@" %p %@", self.str1, self.str1);
    NSLog(@" %p %@\n\n", self.str2, self.str2);
    
    string = @"456";
    
    NSLog(@" %p %@", string, string);
    NSLog(@" %p %@", self.str1, self.str1);
    NSLog(@" %p %@", self.str2, self.str2);
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
