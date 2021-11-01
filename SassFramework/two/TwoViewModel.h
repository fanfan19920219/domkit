//
//  TwoViewModel.h
//  SassFramework
//
//  Created by 智华张 on 2021/10/29.
//

#import <Foundation/Foundation.h>
#import "DateModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TwoViewModel : NSObject

@property (nonatomic,strong) RACCommand * requestCommand;

@property (nonatomic,strong) NSMutableArray *datamodel;

@property (nonatomic,strong) DateModel *model;

@end

NS_ASSUME_NONNULL_END
