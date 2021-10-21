//
//  ThreeViewController.m
//  SassFramework
//
//  Created by 智华张 on 2021/10/14.
//

#import "ThreeViewController.h"

@interface ThreeViewController ()

@end

@implementation ThreeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    UIButton *pushButton  = [UIButton buttonWithType:UIButtonTypeCustom];
    pushButton.frame = CGRectMake(100, 100, 200, 30);
    pushButton.backgroundColor = UIColor.blackColor;
    [pushButton setTitle:@"push到下一个页面" forState:normal];
    [pushButton addTapActionWithBlock:^{
        NSString *customURL = @"SassFramework://NaviPush/MainListViewController?name=home&userId=99999&age=18&adbc=29";
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:customURL] options:@{UIApplicationOpenURLOptionsSourceApplicationKey : @YES} completionHandler:^(BOOL success) {
            
        }];
    }];
    [self.view addSubview:pushButton];
    
    
    UIButton *presentButton  = [UIButton buttonWithType:UIButtonTypeCustom];
    presentButton.frame = CGRectMake(100, 200, 200, 30);
    presentButton.backgroundColor = UIColor.blackColor;
    [presentButton setTitle:@"present到下一个页面" forState:normal];
    [presentButton addTapActionWithBlock:^{
        NSString *customURL = @"SassFramework://PresentModal/SmallVideoListViewController?name=home&userId=99999&age=18&adbc=29";
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:customURL] options:@{UIApplicationOpenURLOptionsSourceApplicationKey : @YES} completionHandler:nil];
    }];
    [self.view addSubview:presentButton];
    
    
//    self.navigationController.navigationBar.hidden = YES;
    
}



-(void)pushVC:(UIButton*)sender{
    
    [self.navigationController pushViewController:[ThreeViewController new] animated:YES];
    
}


- (void)viewWillAppear:(BOOL)animated
    {
        [super viewWillAppear:animated];
        // white.png图片自己下载个纯白色的色块，或者自己ps做一个
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg@3x"] forBarMetrics:UIBarMetricsDefault];
        [self.navigationController.navigationBar setShadowImage:[UIImage new]];
        
    }
- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg"] forBarMetrics:UIBarMetricsDefault];
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
