//
//  UIViewController+Navigation.m
//  右滑返回手势
//
//  Created by SeacenLiu on 2018/5/3.
//  Copyright © 2018年 成. All rights reserved.
//

#import "UIViewController+Navigation.h"
#import <objc/runtime.h>

@implementation UIViewController (Navigation)

- (void)popGestureClose {
    // 禁用侧滑返回手势
    if (self.navigationController && [self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        //这里对添加到右滑视图上的所有手势禁用
        for (UIGestureRecognizer *popGesture in self.navigationController.interactivePopGestureRecognizer.view.gestureRecognizers) {
            popGesture.enabled = NO;
        }
        //若开启全屏右滑，不能再使用下面方法，请对数组进行处理
        //VC.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}

+ (void)popGestureClose:(UIViewController *)VC {
    [VC popGestureClose];
}

- (void)popGestureOpen {
    // 启用侧滑返回手势
    if (self.navigationController && [self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        //这里对添加到右滑视图上的所有手势启用
        for (UIGestureRecognizer *popGesture in self.navigationController.interactivePopGestureRecognizer.view.gestureRecognizers) {
            popGesture.enabled = YES;
        }
        //若开启全屏右滑，不能再使用下面方法，请对数组进行处理
        //VC.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}

+ (void)popGestureOpen:(UIViewController *)VC {
    [VC popGestureOpen];
}

static char *backTitleKey = "backTitleKey";
- (NSString *)backTitle {
    NSString *str = objc_getAssociatedObject(self, backTitleKey);
    if (!str) {
        if (self.navigationController) {
            str = self.navigationController.navigationBar.backItem.title;
        } else {
            @throw [NSException exceptionWithName:@"UIViewController+Navigation Error" reason:@"该控制器没有导航控制器" userInfo:nil];
        }
    }
    return str;
}
- (void)setBackTitle:(NSString *)backTitle {
    if (self.navigationController && self.navigationController.viewControllers.count > 1) {
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:backTitle style:UIBarButtonItemStylePlain target:nil action:nil];
        [self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count-2].navigationItem.backBarButtonItem = backItem;
    } else {
        @throw [NSException exceptionWithName:@"UIViewController+Navigation Error" reason:@"该控制器没有导航控制器或者是根控制器" userInfo:nil];
    }
    objc_setAssociatedObject(self, backTitleKey, backTitle, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
