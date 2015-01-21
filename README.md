MKHDesignableAnimation
===================

Set of helpers that let you automate view animations through designing key view states using Interface Builder.

How to use
---

First of all, you'll need to have IBOutlets declared in your UIView subclass.

```objective-c

// lets declare a UIView subclass with outlets:

@interface MyView <...>

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *button;

<...>

@end


```

After this you should have at least two "*.xib" files with UI designed for that view. These xib files supposed to have only one root view and its class (on "Identity inspector" tab) should be set to your custom `UIView` subclass. Each of these xib files should have slightly different layout of the same set of UI components (from xib to xib they may have different frame, background color, visibility, etc.).

Once you have loaded `MyView` instance with a xib - lets say "MyView.xib", at some point in time you may want to animate your view (usually its subviews) to a "state" that is described with another xib file.

> NOTE:
> It doesn't really matter which xib exactly to use to load your UIView subclass, any of them is okay, but usually (by default) UIView subclass is being loaded with so-called "default" xib (if you does not load it with an explicit xib file name), which should be named the same as your UIView subclass itself. Additional xib files might be named as you wish.

To do so, you just need to call a special method and pass target state xib file name as a parameter. You also have to provide a block where you have to describe animations.

```objective-c

<...>

- (void)doTheAnimation
{
    [self
     switchToState:@"kFirstViewState"
     completion:^{
        
        [self switchToState:@"kDefaultViewState"];
    }];
}

<...>


- (void)switchToState:(NSString)targetState completion:(SimpleBlock)completion
{
    NSString *targetNibName = nil;
    
    if([targetState isEqualToString:@"kFirstViewState"])
    {
        // lets animate to "First" state
        
        targetNibName = @"MyCtrlOne";
    }
    else if([targetState isEqualToString:@"kDefaultViewState"])
    {
        // lets animate to "Default" state
        
        // usually the same as related ViewController subclass name:
        targetNibName = @"MyCtrl";
    }
    
    //===
    
    [self
     animateWithNib:targetNibName
     duration:5.0
     delay:0.0
     options:0
     animations:^(CNVRootView *weakSelf, CNVRootView *targetView) {
         
         weakSelf.label.origin = targetView.label.origin;
         weakSelf.button.origin = targetView.button.origin;
     }
     completion:^(BOOL finished) {
         
         NSLog(@"Animation completed!");
         
         if (completion)
         {
             completion();
         }
     }];
}


<...>

```

Typically you would use the same animations block all the time, but feel free to provide different animations block depending on target state - that works too, it is up to you.

`animations` block gets 2 input `id` parameters:
- `weakSelf` - weak reference to `self`;
- `targetView` - a `MyView` class instance (completely independent from `self`) that has ben loaded from xib file with name `targetNibName`, it represents the same view, but with UI controls layout from the xib file you've provided.

It is supposed that you should update `weakSelf` subviews' parameters (frame, color, alpha, etc.) with corresponding `targetView` subviews' parameters. It is up to you how to use `targetView`, which self subviews must be updated within this block.

How to link to your project
---

Just import main umbrella header "MKHDesignableAnimation.h" like this:

```objective-c
#import <MKHDesignableAnimation/MKHDesignableAnimation.h>
```