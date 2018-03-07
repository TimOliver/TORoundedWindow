//
//  TORoundedWindow.h
//  TORoundedWindowExample
//
//  Created by Tim Oliver on 8/3/18.
//  Copyright © 2018 Tim Oliver. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TORoundedWindow : UIWindow

+ (void)show;
+ (void)showWithCornerRadius:(CGFloat)radius;

+ (BOOL)hidden;
+ (void)setHidden:(BOOL)hidden animated:(BOOL)animated;

+ (void)remove;

@end
