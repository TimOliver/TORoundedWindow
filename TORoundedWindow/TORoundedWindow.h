//
//  TORoundedWindow.h
//
//  Copyright 2018 Timothy Oliver. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to
//  deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
//  OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
//  IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import <UIKit/UIKit.h>

/**
 Presents rounded edge graphics in the corner of the devices screen,
 giving the illusion that the app is rounded.
 */
@interface TORoundedWindow : UIWindow

/** Shows the rounded corner graphics with the default corner radius (Default is 8.0) */
+ (void)show;

/** Shows the rounded corner graphics with a custom corner radius */
+ (void)showWithCornerRadius:(CGFloat)radius;

/** Whether the corner graphics are hidden or not */
+ (BOOL)hidden;

/** Set the corner graphics to hidden or visible, optionally with a crossfade animation */
+ (void)setHidden:(BOOL)hidden animated:(BOOL)animated;

/** Remove this window and dealloc it from memory entirely */
+ (void)remove;

@end
