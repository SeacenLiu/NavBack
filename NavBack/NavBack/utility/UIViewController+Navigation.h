//
//  UIViewController+Navigation.h
//  右滑返回手势
//
//  Created by SeacenLiu on 2018/5/3.
//  Copyright © 2018年 成. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Navigation)

/**
 禁用右滑返回手势
 @discussion 添加在viewWillDisappear方法中
 */

- (void)popGestureClose;
/**
 禁用右滑返回手势

 @param VC 需要设置的控制器
 @discussion 添加在viewDidAppear方法中
 */
+ (void)popGestureClose:(UIViewController *)VC;

/**
 开启右滑返回手势
 @discussion 添加在viewDidAppear方法中
 */
- (void)popGestureOpen;

/**
 开启右滑返回手势
 
 @param VC 需要设置的控制器
 @discussion 添加在viewWillDisappear方法中
 */
+ (void)popGestureOpen:(UIViewController *)VC;

/**
 backItem的Title
 @discussion 注意设置的backItem是在分类中设置到前一个控制器中了
             用于保持原生右滑返回手势，修改显示文字
 */
@property (nonatomic, copy) NSString *backTitle;

@end
