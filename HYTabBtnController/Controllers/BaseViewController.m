//
//  BaseViewController.m
//  HYTabBtnController
//
//  Created by 胡杨 on 2017/5/6.
//  Copyright © 2017年 Hoo. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@property (nonatomic, weak) UILabel *label;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 60)];
    label.center = self.view.center;
    label.textAlignment = NSTextAlignmentCenter;
    self.label = label;
    [self.view addSubview:label];
}

- (void)setContent:(NSString *)content {
    self.label.text = content;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
