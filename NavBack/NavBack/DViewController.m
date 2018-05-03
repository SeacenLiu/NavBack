//
//  DViewController.m
//  右滑返回手势
//
//  Created by SeacenLiu on 2018/5/3.
//  Copyright © 2018年 成. All rights reserved.
//

#import "DViewController.h"
#import "UIViewController+Navigation.h"

@interface DViewController ()

@end

@implementation DViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置到当前界面的返回item上的
    NSLog(@"设置前: %@", self.backTitle);
    self.backTitle = @"返回";
    NSLog(@"设置后: %@", self.backTitle);
}

- (void)demo {
    // 创建一个实例对象，并自定义返回的文字，若不这样处理，默认是当前页面的title
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    // 设置自定义的返回按钮
    self.navigationItem.backBarButtonItem = backItem; // 设置到下一个界面的返回item上的
}

@end
