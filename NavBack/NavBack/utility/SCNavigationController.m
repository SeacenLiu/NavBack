//
//  SCNavigationController.m
//  右滑返回手势
//
//  Created by SeacenLiu on 2018/5/3.
//  Copyright © 2018年 成. All rights reserved.
//

#import "SCNavigationController.h"

@interface SCNavigationController () <UIGestureRecognizerDelegate>

@end

@implementation SCNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [super viewDidLoad];
    
    //设全屏启动右滑返回手势，此处可以优化为 iPad 上支持全屏
    if ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)) {
        id target = self.interactivePopGestureRecognizer.delegate;
        SEL handler = NSSelectorFromString(@"handleNavigationTransition:");
        // 获取添加系统边缘触发手势的View
        UIView *targetView = self.interactivePopGestureRecognizer.view;
        // 创建pan手势 作用范围是全屏
        UIPanGestureRecognizer *fullScreenGes = [[UIPanGestureRecognizer alloc]initWithTarget:target action:handler];
        fullScreenGes.delegate = self;
        [targetView addGestureRecognizer:fullScreenGes];
        // 关闭边缘触发手势 防止和原有边缘手势冲突（也可不用关闭）
        [self.interactivePopGestureRecognizer setEnabled:NO];
    }

    // 设置右滑返回手势的代理为自身
    __weak typeof(self) weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = (id)weakSelf;
    }
    
    // 自定义返回按钮的视图，如细化返回图标。
    [self.navigationBar setBackIndicatorImage:[UIImage imageNamed:@"navi_back_icon"]];
    [self.navigationBar setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"navi_back_icon"]];
    // 设置tintColor 改变自定图片颜色
    self.navigationBar.tintColor = [UIColor whiteColor];
}

#pragma mark - UIGestureRecognizerDelegate
// 这个方法是在手势将要激活前调用：返回YES允许右滑手势的激活，返回NO不允许右滑手势的激活
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
        //屏蔽调用rootViewController的滑动返回手势，避免右滑返回手势引起死机问题
        if (self.viewControllers.count < 2 || self.visibleViewController == [self
            .viewControllers objectAtIndex:0]) {
            return NO;
        }
    }
    // 这里就是非右滑手势调用的方法啦，统一允许激活
    return YES;
}

@end
