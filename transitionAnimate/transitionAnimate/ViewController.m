//
//  ViewController.m
//  transitionAnimate
//
//  Created by slience on 2017/2/3.
//  Copyright © 2017年 Ninja. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"


#pragma mark - One VC
@interface One : UIViewController

@end

@implementation One

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"One";
    self.view.backgroundColor = [UIColor whiteColor];
}

@end

#pragma mark - Two VC

@interface Two : UIViewController

@end

@implementation Two

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Two";
    self.view.backgroundColor = [UIColor whiteColor];
}
@end


@interface Test : UIViewController

@end

@implementation Test

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Test";
    self.view.backgroundColor = [UIColor whiteColor];
}
@end


@interface NJTabBarViewController : UITabBarController

@end

@implementation NJTabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    One *one = [One new];
    
    //设置控制器
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:one];
    
    Two *two = [Two new];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:two];
    
    self.viewControllers = @[nav1, nav2];
    
    //设置底部的item的title
    NSArray *titles = @[@"one", @"two"];
    for (NSInteger i = 0; i < self.tabBar.items.count; ++i) {
        UITabBarItem *item = self.tabBar.items[i];
        item.title = titles[i];
    }
}

@end


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"wallpaper1"].CGImage);
    NJTabBarViewController *njTab = [NJTabBarViewController new];
    //2秒后,跳转到tabBar.
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [njTab setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
        [self presentViewController:njTab animated:YES completion:nil];
    });
    //2.5秒后,把根控制器更换为njTab.
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        AppDelegate *appd = (AppDelegate *)[UIApplication sharedApplication].delegate;
        appd.window.rootViewController = njTab;
    });
}

@end




























