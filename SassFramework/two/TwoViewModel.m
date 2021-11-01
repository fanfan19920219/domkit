//
//  TwoViewModel.m
//  SassFramework
//
//  Created by 智华张 on 2021/10/29.
//

#import "TwoViewModel.h"

@implementation TwoViewModel


- (instancetype)init
{
    if(self = [super init])
    {
        [self setUp];
    }
    return self;
}

- (void)setUp
{
    _requestCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        NSLog(@"传参=%@",input[@"code"]);
        // 创建信号
        RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            
            // 网络请求
            [subscriber sendNext:input[@"code"]];
            
            [subscriber sendCompleted];
                
            return [RACDisposable disposableWithBlock:^{
                NSLog(@"调用结果结束了");
            }];;
        }];
        return signal;
    }];
}

/*
 // 创建信号
 RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
     
     // 网络请求
     [MBProgressHUD showMessage:@"加载中.."];
     [HQNetworking getWithUrl:[NSString stringWithFormat:@"%@index.ashx",KHttpUrl] success:^(id response) {
         
         [MBProgressHUD hideHUD];
         [subscriber sendNext:@"123"];
         
         
     } fail:^(NSError *error) {
         [MBProgressHUD hideHUD];
         [MBProgressHUD showError:@"网络连接失败"];
         [subscriber sendNext:@"123"];
     }];
     
     return nil;
 }];
 */

-(NSMutableArray*)datamodel{
    if(!_datamodel){
        _datamodel = [NSMutableArray new];
        for(int i = 0 ; i <= 10 ; i++){
            DateModel *datamodel = [DateModel new];
            datamodel.number = 3;
            [_datamodel addObject:datamodel];
        }
    }
    return _datamodel;
}

@end
