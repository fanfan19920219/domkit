//
//  ChatViewController.m
//  SassFramework
//
//  Created by 智华张 on 2021/10/22.
//



#import "ChatViewController.h"
#import "JXYChatView.h"

@interface ChatViewController ()

@property (nonatomic, strong) JXYChatView *imChatView;
@end



@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.imChatView];
}


- (JXYChatView *)imChatView {
    JXYChatView *imChatView = [[JXYChatView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    return imChatView;
}


@end
