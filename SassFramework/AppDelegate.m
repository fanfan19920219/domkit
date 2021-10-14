//
//  AppDelegate.m
//  SassFramework
//
//  Created by 智华张 on 2021/10/14.
//



#ifdef DEBUG
#import <DoraemonKit/DoraemonManager.h>
#endif



#import "AppDelegate.h"
#import "ViewController.h"
#import "JLRoutes.h"
#import "JianShuTabBarVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];

    self.window.rootViewController = [[BaseNavigationController alloc] initWithRootViewController:[[JianShuTabBarVC alloc]init]];
    [self.window makeKeyAndVisible];
    
#ifdef DEBUG
    [[DoraemonManager shareInstance] addH5DoorBlock:^(NSString *h5Url) {
        //使用自己的H5容器打开这个链接
    }];
    [[DoraemonManager shareInstance] install];
#endif

    
    
//    [[JLRoutes globalRoutes] addRoute:@"取url内容值的标识" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
//
//        return YES; // 一旦匹配，立即返回 YES
//    }];
    
    
    if (@available(iOS 15.0, *)) {
           UINavigationBar *navigationBar = [UINavigationBar appearance];
           
//           UINavigationBarAppearance *scrollEdgeAppearance = [[UINavigationBarAppearance alloc] init];
////           scrollEdgeAppearance.backgroundColor = UIColor.redColor;
//           navigationBar.scrollEdgeAppearance = scrollEdgeAppearance;
//
//           UINavigationBarAppearance *standardAppearance = [[UINavigationBarAppearance alloc] init];
//           standardAppearance.backgroundColor = UIColor.greenColor;
//           navigationBar.standardAppearance = standardAppearance;
       }
    
    return YES;
}
























//#pragma mark - UISceneSession lifecycle
//
//
//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}
//
//
//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}


@end

