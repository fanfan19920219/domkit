//
//  TwoViewModel.h
//  SassFramework
//
//  Created by 智华张 on 2021/10/29.
//

#import <Foundation/Foundation.h>
#import "DateModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TwoViewModel : NSObject<UITableViewDelegate, UITableViewDataSource>


//这个用来网络的回调
@property (nonatomic,strong) RACCommand * requestCommand;
//行为回调
@property (nonatomic, strong) RACSubject *btnClickSingnal;

@property (nonatomic,strong) NSMutableArray *datamodel;

@property (nonatomic,strong) DateModel *model;

@end

NS_ASSUME_NONNULL_END
