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
    // Do any additional setup after loading the view.
    
    
    UIButton *pushButton  = [UIButton buttonWithType:UIButtonTypeCustom];
    pushButton.frame = CGRectMake(100, 100, 200, 30);
    pushButton.backgroundColor = UIColor.redColor;
    [pushButton setTitle:@"push到下一个页面" forState:normal];
    [pushButton addTapActionWithBlock:^{
        NSString *customURL = @"SassFramework://NaviPush/SmallVideoListViewController?name=home&userId=99999&age=18&adbc=29";
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:customURL] options:@{UIApplicationOpenURLOptionsSourceApplicationKey : @YES} completionHandler:nil];
    }];
    [self.view addSubview:pushButton];
    
    
    UIButton *presentButton  = [UIButton buttonWithType:UIButtonTypeCustom];
    presentButton.frame = CGRectMake(100, 200, 200, 30);
    presentButton.backgroundColor = UIColor.redColor;
    [presentButton setTitle:@"present到下一个页面" forState:normal];
    [presentButton addTapActionWithBlock:^{
        NSString *customURL = @"SassFramework://PresentModal/SmallVideoListViewController?name=home&userId=99999&age=18&adbc=29";
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:customURL] options:@{UIApplicationOpenURLOptionsSourceApplicationKey : @YES} completionHandler:nil];
    }];
    [self.view addSubview:presentButton];
    
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
