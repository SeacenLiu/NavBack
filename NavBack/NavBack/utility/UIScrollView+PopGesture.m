//
//  UIScrollView+PopGesture.m
//  右滑返回手势
//
//  Created by SeacenLiu on 2018/5/3.
//  Copyright © 2018年 成. All rights reserved.
//

#import "UIScrollView+PopGesture.h"

///是滑动返回距左边的有效长度
static const int kLocation_X = 40;

@implementation UIScrollView (PopGesture)

//此方法返回YES时，手势事件会一直往下传递，不论当前层次是否对该事件进行响应。
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    if ([self panBack:gestureRecognizer]) {
        return YES;
    }
    return NO;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if ([self panBack:gestureRecognizer]) {
        return NO;
    }
    return YES;
}

//location_X可自己定义，其代表的是滑动返回距左边的有效长度
- (BOOL)panBack:(UIGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer == self.panGestureRecognizer) {
        UIPanGestureRecognizer *pan = (UIPanGestureRecognizer *)gestureRecognizer;
        CGPoint point = [pan translationInView:self];
        UIGestureRecognizerState state = gestureRecognizer.state;
        if (UIGestureRecognizerStateBegan == state || UIGestureRecognizerStatePossible == state) {
            CGPoint location = [gestureRecognizer locationInView:self];
            //下面的是只允许在第一张时滑动返回生效
            if (point.x > 0 && location.x < kLocation_X && self.contentOffset.x <= 0) {
                return YES;
            }
            //   这是允许每张图片都可实现滑动返回
//            int temp1 = location.x;
//            int temp2 = UIScreen.mainScreen.bounds.size.width;
//            NSInteger XX = temp1 % temp2;
//            if (point.x > 0 && XX < kLocation_X) {
//                return YES;
//            }
        }
    }
    return NO;
}

@end
