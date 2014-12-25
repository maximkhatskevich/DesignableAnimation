//
//  UIView+MKHDesignableAnimation.m
//  DesignableAnimation
//
//  Created by Maxim Khatskevich on 26/12/14.
//  Copyright (c) 2014 Maxim Khatskevich. All rights reserved.
//

#import "UIView+MKHDesignableAnimation.h"

@implementation UIView (MKHDesignableAnimation)

- (void)animateWithNib:(NSString *)targetNibName
              duration:(NSTimeInterval)duration
                 delay:(NSTimeInterval)delay
               options:(UIViewAnimationOptions)options
            animations:(void (^)(UIView *targetView))animations
            completion:(void (^)(BOOL finished))completion
{
    static UIViewController *ctrl = nil;
    
    if ([targetNibName isKindOfClass:NSString.class] &&
        targetNibName.length &&
        animations)
    {
        if (!ctrl)
        {
            ctrl = [UIViewController new];
        }
        
        //===
        
        // load target view:
        
        __block UIView *targetView =
        [[NSBundle mainBundle]
         loadNibNamed:targetNibName owner:ctrl options:nil].lastObject;
        
        //===
        
        // animate:
        
        [UIView
         animateWithDuration:duration
         delay:delay
         options:options
         animations:^{
             
             animations(targetView);
         }
         completion:completion];
    }
}

- (void)animateWithNib:(NSString *)targetNibName
            animations:(void (^)(UIView *targetView))animations
            completion:(void (^)(BOOL finished))completion
{
    [self
     animateWithNib:targetNibName
     duration:0.7
     delay:0.0
     options:0
     animations:animations
     completion:completion];
}

- (void)animateWithNib:(NSString *)targetNibName
            animations:(void (^)(UIView *targetView))animations
{
    [self
     animateWithNib:targetNibName
     duration:0.7
     delay:0.0
     options:0
     animations:animations
     completion:nil];
}

@end
