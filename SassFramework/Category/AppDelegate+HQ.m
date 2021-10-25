//
//  AppDelegate+HQ.m
//  HQMVVM_RAC_Router
//
//  Created by Mr_Han on 2018/11/13.
//  Copyright © 2018 Mr_Han. All rights reserved.
//  CSDN <https://blog.csdn.net/u010960265>
//  GitHub <https://github.com/HanQiGod>
//

#import "AppDelegate+HQ.h"
#import "JLRoutes.h"
#import "HQTabBarController.h"

#import "ThreeViewController.h"
#import "TwoViewController.h"
#import "MainListViewController.h"
#import "FoldTableViewController.h"
#import "LXAlipayViewController.h"
#import "LRLoginViewController.h"

#import <objc/message.h>
#import <objc/runtime.h>
@implementation AppDelegate (WZX)
    
- (void)registerRoutes{
    
    
    HQTabBarController *rootVC = [HQTabBarController  tabBarControllerWithAddChildVCsBlock:^(HQTabBarController *tabBarC) {
        
        [tabBarC addChildVC:[FoldTableViewController new] title:@"猎头聊天" normalImageName:@"tabar_linxin2.png"  selectedImageName:@"tabar_linxin.png" isRequiredNavController:YES];
        
        [tabBarC addChildVC:[LXAlipayViewController new] title:@"工作台" normalImageName:@"tabar_zhuye2.png" selectedImageName:@"tabar_zhuye.png" isRequiredNavController:YES];
        
        
//        [tabBarC addChildVC:[ThreeViewController new] title:@"主页2" normalImageName:@"tabar_tuijian2.png" selectedImageName:@"tabar_tuijiani.png" isRequiredNavController:YES];
        [tabBarC addChildVC:[TwoViewController new] title:@"通讯录" normalImageName:@"tabar_suishoupai2.png" selectedImageName:@"tabar_suishoupai.png" isRequiredNavController:YES];
       
        [tabBarC addChildVC:[ThreeViewController new] title:@"我的" normalImageName:@"tabar_geren2.png" selectedImageName:@"tabar_geren.png" isRequiredNavController:YES];
        
    }];
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = rootVC;
    [self.window makeKeyAndVisible];
    
    LRLoginViewController* loginVC =   [LRLoginViewController new];
    loginVC.modalPresentationStyle =UIModalPresentationFullScreen;
    [self.window.rootViewController presentViewController:loginVC animated:NO completion:^{

    }];
    
    // navigation Push规则
    [[JLRoutes globalRoutes] addRoute:@"/NaviPush/:controller" handler:^BOOL(NSDictionary<NSString *,NSString *> * _Nonnull parameters) {
        
        NSLog(@"parameters==%@",parameters);
        UIViewController *v = [[NSClassFromString(parameters[@"controller"]) alloc] init];
        [self paramToVc:v param:parameters];
        [[self currentViewController] pushViewController:v animated:YES];
        return YES;
    }];
    
    
    // 模态窗口规则
    [[JLRoutes globalRoutes] addRoute:@"/PresentModal/:controller" handler:^BOOL(NSDictionary<NSString *,NSString *> * _Nonnull parameters) {
        
        NSLog(@"parameters==%@",parameters);
        UIViewController *v = [[NSClassFromString(parameters[@"controller"]) alloc] init];
        v.modalPresentationStyle = UIModalPresentationFullScreen;
        [self paramToVc:v param:parameters];
        [[self currentViewController].visibleViewController presentViewController:v animated:YES completion:^{}];
        return YES;
    }];
    
    
    
}
    
-(void)paramToVc:(UIViewController *) v param:(NSDictionary<NSString *,NSString *> *)parameters{
    //        runtime将参数传递至需要跳转的控制器
    unsigned int outCount = 0;
    objc_property_t * properties = class_copyPropertyList(v.class , &outCount);
    for (int i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        NSString *key = [NSString stringWithUTF8String:property_getName(property)];
        NSString *param = parameters[key];
        if (param != nil) {
            [v setValue:param forKey:key];
        }
    }
}
    
    /**
     *          获取当前控制器
     */
-(UINavigationController *)currentViewController{
    
    HQTabBarController *HQTabBar = (HQTabBarController *)self.window.rootViewController;
    return HQTabBar.selectedViewController;
}
    
    
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    NSLog(@"从哪个app跳转而来 Bundle ID: %@", options[UIApplicationOpenURLOptionsSourceApplicationKey]);
    NSLog(@"URL scheme:%@", [url scheme]);
    
#pragma mark - JLRoutes（默认的Scheme）
    
    return [[JLRoutes globalRoutes] routeURL:url];
}
    
    
    
    @end
