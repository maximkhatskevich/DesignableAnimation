//
//  UIView+MKHDesignableAnimation.h
//  DesignableAnimation
//
//  Created by Maxim Khatskevich on 26/12/14.
//  Copyright (c) 2014 Maxim Khatskevich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MKHDesignableAnimation)

- (void)animateWithNib:(NSString *)targetNibName
              duration:(NSTimeInterval)duration
                 delay:(NSTimeInterval)delay
               options:(UIViewAnimationOptions)options
            animations:(void (^)(id weakSelf, id targetView))animations
            completion:(void (^)(BOOL finished))completion;

- (void)animateWithNib:(NSString *)targetNibName
            animations:(void (^)(id weakSelf, id targetView))animations
            completion:(void (^)(BOOL finished))completion;

- (void)animateWithNib:(NSString *)targetNibName
            animations:(void (^)(id weakSelf, id targetView))animations;

@end
