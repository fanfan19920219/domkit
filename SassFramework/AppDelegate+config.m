//
//  AppDelegate+config.m
//  SassFramework
//
//  Created by 智华张 on 2021/10/14.
//

#import "AppDelegate+config.h"
#import "AvoidCrash.h"
#import <Bugly/Bugly.h>//腾讯bugl

@implementation AppDelegate (config)

-(void)config{
    [self registAvoidCrash];
}




- (void)registAvoidCrash {
    //启动防止崩溃功能(注意区分becomeEffective和makeAllEffective的区别)
    //具体区别请看 AvoidCrash.h中的描述
    //建议在didFinishLaunchingWithOptions最初始位置调用 上面的方法

    [AvoidCrash makeAllEffective];

    //================================================
    //   1、unrecognized selector sent to instance（方式1）
    //================================================


    //若出现unrecognized selector sent to instance导致的崩溃并且控制台输出:
    //-[__NSCFConstantString initWithName:age:height:weight:]: unrecognized selector sent to instance
    //你可以将@"__NSCFConstantString"添加到如下数组中，当然，你也可以将它的父类添加到下面数组中
    //比如，对于部分字符串，继承关系如下
    //__NSCFConstantString --> __NSCFString --> NSMutableString --> NSString
    //你可以将上面四个类随意一个添加到下面的数组中，建议直接填入 NSString

    //我所开发的项目中所防止unrecognized selector sent to instance的类有下面几个，主要是防止后台数据格式错乱导致的崩溃。个人觉得若要防止后台接口数据错乱，用下面的几个类即可。
    //NSStringFromClass(NSString.class);
    NSArray *noneSelClassStrings = @[
                                     @"NSNull",
                                     @"NSNumber",
                                     @"NSString",
                                     @"NSDictionary",
                                     @"NSArray"
                                     ];
    [AvoidCrash setupNoneSelClassStringsArr:noneSelClassStrings];


    //================================================
    //   2、unrecognized selector sent to instance（方式2）
    //================================================

    //若需要防止某个前缀的类的unrecognized selector sent to instance
    //比如你所开发项目中使用的类的前缀:CC、DD
    //你可以调用如下方法
    //NSArray *noneSelClassPrefix = @[
    //                                @"CC",
    //                                @"DD"
    //                                ];
    //[AvoidCrash setupNoneSelClassStringPrefixsArr:noneSelClassPrefix];

    //监听通知:AvoidCrashNotification, 获取AvoidCrash捕获的崩溃日志的详细信息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dealwithCrashMessage:) name:AvoidCrashNotification object:nil];
}

/**
 * 监听捕获到的异常
 */
- (void)dealwithCrashMessage:(NSNotification *)note {
    //注意:所有的信息都在userInfo中
    //你可以在这里收集相应的崩溃信息进行相应的处理(比如传到自己服务器)

    //异常拦截并且通过bugly上报
    NSDictionary *info = note.userInfo;
    NSString *errorReason = [NSString stringWithFormat:@"异常拦截\n【Error原因】%@========\n【Error位置】%@========\n【解决方式】%@========\n【错误名】%@", info[@"errorReason"], info[@"errorPlace"], info[@"defaultToDo"], info[@"errorName"]];
    NSArray *callStack = info[@"callStackSymbols"];

    // Bugly 上报错误信息
    [Bugly reportExceptionWithCategory:3 name:@"错误信息" reason:errorReason callStack:callStack extraInfo:info terminateApp:NO];
}
///** bugly 上报错误信息 */
//- (void)reportErrorName:(NSString *)errorName errorReason:(NSString *)errorReason callStack:(NSArray *)aStackArray extraInfo:(NSDictionary *)info{
//
//    [Bugly reportExceptionWithCategory:3 name:errorName reason:errorReason callStack:aStackArray extraInfo:info terminateApp:NO];
//}



@end
