//
//  UIViewController+Navigation.h
//  右滑返回手势
//
//  Created by SeacenLiu on 2018/5/3.
//  Copyright © 2018年 成. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Navigation)

- (void)popGestureClose;
+ (void)popGestureClose:(UIViewController *)VC;

- (void)popGestureOpen;
+ (void)popGestureOpen:(UIViewController *)VC;

@property (nonatomic, copy) NSString *backTitle;

@end
