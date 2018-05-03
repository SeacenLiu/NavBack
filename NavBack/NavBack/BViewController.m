//
//  BViewController.m
//  右滑返回手势
//
//  Created by SeacenLiu on 2018/5/2.
//  Copyright © 2018年 成. All rights reserved.
//

#import "BViewController.h"
#import "UIScrollView+PopGesture.h"

@interface BViewController ()

@end

@implementation BViewController

- (void)leftAction {
    NSLog(@"左侧UIBarButtonItem");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithTitle:@"test" style:UIBarButtonItemStyleDone target:self action:@selector(leftAction)];
    self.navigationItem.leftBarButtonItem = left;
    
//    self.navigationItem.leftItemsSupplementBackButton = YES;
    
    // 测试ScrollView
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:UIScreen.mainScreen.bounds];
    [self.view addSubview:scrollView];
    scrollView.pagingEnabled = YES;
    scrollView.backgroundColor = [UIColor lightGrayColor];
    int count = 5;
    CGFloat width = UIScreen.mainScreen.bounds.size.width;
    CGFloat height = UIScreen.mainScreen.bounds.size.height;
    scrollView.contentSize = CGSizeMake(width*count, 0);
    for (int i = 0; i < count; i++) {
        UIView *v = [[UIView alloc] initWithFrame:CGRectMake(i * width, 0, width, height)];
        v.backgroundColor = i%2 ? [UIColor redColor] : [UIColor blueColor];
        [scrollView addSubview:v];
    }
}

@end
