//
//  EViewController.m
//  右滑返回手势
//
//  Created by SeacenLiu on 2018/5/3.
//  Copyright © 2018年 成. All rights reserved.
//

#import "EViewController.h"

@interface EViewController ()

@end

@implementation EViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //自定义返回按钮
    UIButton *studySearch = [UIButton buttonWithType:UIButtonTypeCustom];
    [studySearch setImage:[UIImage imageNamed:@"study_search"] forState:UIControlStateNormal];
    [studySearch sizeToFit];
    [studySearch addTarget:self action:@selector(studySearchAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *studySearchItem = [[UIBarButtonItem alloc] initWithCustomView:studySearch];
    self.navigationItem.leftBarButtonItems = @[studySearchItem];
    //是否支持显示左滑返回按钮，NO不显示：leftBarButtonItems覆盖backBarButtonItem，
    //YES显示：backBarButtonItem 显示在leftBarButtonItems左侧
    self.navigationItem.leftItemsSupplementBackButton = YES;
}

@end
