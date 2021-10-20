//
//  HTNetwork.h
//  SassFramework
//
//  Created by 智华张 on 2021/10/15.
//


/*
 YTKNetwork包含了这几个类：
 1、YTKNetworkConfig （设置域名）
 2、YTKRequest （网络请求）
 3、YTKBatchRequest （请求多个类 ）
 4、YTKChainRequest （依赖请求）
 5、YTKBaseRequest（YTKRequest的父类）
 */
#import <Foundation/Foundation.h>
#import "YTKRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface HTNetwork : NSObject

@end

NS_ASSUME_NONNULL_END
