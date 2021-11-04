//
//  TwoViewController.m
//  SassFramework
//
//  Created by 智华张 on 2021/10/14.
//

#import "TwoViewController.h"
#import "TwoViewModel.h"
#import "DateModel.h"

@interface TwoViewController ()

@property (nonatomic, strong)TwoViewModel *viewModel;//管理网络请求和数据绑定等
@property (nonatomic, assign)NSInteger rowNumber;

@property (nonatomic, strong)UITableView *tableview;
@property (nonatomic, strong)UIButton *centerButton;

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.rowNumber = 10;
    //初始化UI
    [self configUI];

}

-(void)configUI{
    
    self.centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.centerButton.frame = CGRectMake(100, 100, 100, 30);
    self.centerButton.backgroundColor = UIColor.redColor;
    [self.view addSubview:self.centerButton];
    
    __weak typeof(self) weakSelf = self;
    [self.centerButton addTapActionWithBlock:^{
        [weakSelf initNetwork];
    }];
    
    [self.viewModel.btnClickSingnal subscribeNext:^(id  _Nullable x) {
        NSLog(@"x信号     %@",x);

    }];
    
}

-(void)initNetwork{
    // 发送请求
    RACSignal *signal = [self.viewModel.requestCommand execute:@{@"code":@"这里是初始化网络请求的参数 param "}];
    [signal subscribeNext:^(id x) {
        NSLog(@"receive param %@",x);
//            NSString *customURL = @"HQMVVMRACRouter://NaviPush/TwoViewController?name=home&userId=99999&age=18&adbc=29";
//            [[UIApplication sharedApplication]openURL:[NSURL URLWithString:customURL] options:@{UIApplicationOpenURLOptionsSourceApplicationKey : @YES} completionHandler:nil];
        [self.view addSubview:self.tableview];
    }];
}

-(TwoViewModel*)viewModel{
    if(!_viewModel){
        _viewModel = [[TwoViewModel alloc]init];
    }
    return _viewModel;
}

-(UITableView*)tableview{
    if(!_tableview){
        _tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableview.delegate = self.viewModel;
        _tableview.dataSource = self.viewModel;
    }
    return  _tableview;
}


@end
