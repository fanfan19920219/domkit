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
    
//    [_requestCommand execute:<#(nullable id)#>]
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




//tableview的代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.datamodel.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellid = @"cellid";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    
    if(cell==nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    
    DateModel *model = self.datamodel[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",model.number];
    return  cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DateModel *model = self.datamodel[indexPath.row];
    model.number ++;
    [tableView reloadData];
    
    
    [self.btnClickSingnal sendNext:@"哒"];
    
    
    
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

-(RACSubject*)btnClickSingnal{
    if(!_btnClickSingnal){
        _btnClickSingnal = [RACSubject subject];
    }
    return _btnClickSingnal;;
}

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
