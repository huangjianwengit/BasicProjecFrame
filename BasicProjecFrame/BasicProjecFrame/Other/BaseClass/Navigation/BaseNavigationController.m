//
//  BaseNavigationController.m
//  BasicProjecFrame
//
//  Created by Jivan on 2018/1/8.
//  Copyright © 2018年 Jivan. All rights reserved.
//

#import "BaseNavigationController.h"
#import "Expand.h"
@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


#pragma mark ---- <UIGestureRecognizerDelegate>

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    // 判断下当前是不是在根控制器
     return self.childViewControllers.count > 1;
}


//二级页面隐藏底部tabBar
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [viewController.navigationItem.backBarButtonItem setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:10]} forState:UIControlStateNormal];
    
    if (self.childViewControllers.count > 0) {
        
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"navigationbar_back" heighlightImage:@"navigationbar_back_highlighted"];
    }
    
    [super pushViewController:viewController animated:YES];
    
}

-(void)back {
    
    // 判断两种情况: push 和 present
    if ((self.presentedViewController || self.presentingViewController) && self.childViewControllers.count == 1) {
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }else{
        
       [self popViewControllerAnimated:YES];
    }
    
}


- (UIViewController *)childViewControllerForStatusBarStyle{
    return self.topViewController;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
