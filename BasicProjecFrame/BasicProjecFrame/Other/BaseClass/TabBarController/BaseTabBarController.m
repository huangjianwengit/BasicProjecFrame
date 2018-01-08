//
//  BaseTabBarController.m
//  BasicProjecFrame
//
//  Created by Jivan on 2018/1/8.
//  Copyright © 2018年 Jivan. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseViewController.h"
#import "BaseNavigationController.h"
#import "BaseTabBar.h"
@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //添加子视图控制器
    [self setupChildControllers];
    
    [self setTabBar];
}

-(void)setTabBar
{
    BaseTabBar *tabBar = [[BaseTabBar alloc] init];
    // KVC：如果要修系统的某些属性，但被设为readOnly，就是用KVC，即setValue：forKey：。
    [self setValue:tabBar forKey:@"tabBar"];
    
}
-(void)setupChildControllers
{
    
//  [self setupChildNavigationControllerWithClass:[BaseNavigationController class] tabBarImageName:@"Main" rootViewControllerClass:[MainViewController class] rootViewControllerTitle:@"XXX"];

}

#pragma mark - 添加子视图控制器
- (void)setupChildNavigationControllerWithClass:(Class)class tabBarImageName:(NSString *)name rootViewControllerClass:(Class)rootViewControllerClass rootViewControllerTitle:(NSString *)title
{
    BaseViewController *rootVC = [[rootViewControllerClass alloc] init];
    rootVC.title = title;
    BaseNavigationController *navVc = [[class  alloc] initWithRootViewController:rootVC];
    navVc.tabBarItem.image = [[UIImage imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navVc.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_sel", name]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:navVc];
}

#pragma mark - UITabBarDelegate

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{

    NSInteger index = [self.tabBar.items indexOfObject:item];
    //添加Item选择动画
    [self animationWithIndex:index];
    
}
- (void)animationWithIndex:(NSInteger) index {
    
    NSMutableArray * tabbarbuttonArray = [NSMutableArray array];
    
    for (UIView *tabBarButton in self.tabBar.subviews) {
        
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabbarbuttonArray addObject:tabBarButton];
        }
    }
    CABasicAnimation*pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulse.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pulse.duration = 0.25;
    pulse.repeatCount= 1;
    pulse.autoreverses= YES;
    pulse.fromValue= [NSNumber numberWithFloat:0.7];
    pulse.toValue= [NSNumber numberWithFloat:1.2];
  
    [[tabbarbuttonArray[index] layer] addAnimation:pulse forKey:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
