//
//  MainListViewController.m
//  SassFramework
//
//  Created by 智华张 on 2021/10/21.
//

#import "MainListViewController.h"

@interface MainListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@end

@implementation MainListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
//    self.title = @"主页";
    self.navigationController.navigationBar.hidden = YES;
}



-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    
    self.navigationController.navigationBar.hidden = NO;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSString *customURL = @"SassFramework://NaviPush/ChatViewController?name=home&userId=99999&age=18&adbc=29";
//    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:customURL] options:@{UIApplicationOpenURLOptionsSourceApplicationKey : @YES} completionHandler:^(BOOL success) {
//    }];
    
    //LRLoginViewController
    NSString *customURL = @"SassFramework://PresentModal/LRLoginViewController?name=home&userId=99999&age=18&adbc=29";
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:customURL] options:@{UIApplicationOpenURLOptionsSourceApplicationKey : @YES} completionHandler:^(BOOL success) {
    }];
    
    
    
    
    
}



-(UITableView*)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *cellid = @"cellid";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell.textLabel.text = @" 但愿人常在，千里共婵娟。";
    }
    return  cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return   10;
}






@end
