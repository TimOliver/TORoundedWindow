//
//  TORoundedWindow.m
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

#import "TORoundedWindow.h"

// Global copy used to retain the window until dismissed
static TORoundedWindow *_sharedWindow = nil;

@interface TORoundedWindow ()

@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, strong) NSMutableArray *cornerViews;
@property (nonatomic, strong) UIImage *cornerImage;

@property (nonatomic, assign) CGFloat cornerAlpha;

@end

@implementation TORoundedWindow

- (instancetype)initWithCornerRadius:(CGFloat)radius
{
    CGRect mainScreenBounds = [UIScreen mainScreen].bounds;
    
    // This is a really silly way to detect if we're running on an iPhone X.
    // If we're presenting this window before the app has finished setting up,
    // `safeAreaInsets` is still set to 0.
    if (@available(iOS 11.0, *)) {
        
        CGFloat width = MIN(mainScreenBounds.size.width, mainScreenBounds.size.height);
        CGFloat height = MAX(mainScreenBounds.size.height, mainScreenBounds.size.width);
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone && height / width > 2.0f) {
            return nil;
        }
    }
    
    if (self = [super initWithFrame:mainScreenBounds]) {
        self.radius = radius;
        [self setUp];
    }
    
    return self;
}

- (void)setUp
{
    self.rootViewController = [[UIViewController alloc] init]; // Annoying, but necessary if setting up in the app delegate
    [self.rootViewController.view removeFromSuperview];
    
    self.backgroundColor = [UIColor clearColor];
    self.userInteractionEnabled = NO;
    
    self.cornerImage = [TORoundedWindow cornerImageWithRadius:self.radius];
    
    CGFloat angle = 0.0;
    self.cornerViews = [NSMutableArray array];
    for (NSInteger i = 0; i < 4; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:self.cornerImage];
        imageView.transform = CGAffineTransformRotate(CGAffineTransformIdentity, angle);
        angle += M_PI_2;
        [self.cornerViews addObject:imageView];
        [self addSubview:imageView];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGSize boundsSize = self.bounds.size;
    CGRect frame = CGRectZero;
    
    // Loop t
    for (NSInteger i = 0; i < 4; i++) {
        UIImageView *view = self.cornerViews[i];
        frame = view.frame;
        frame.origin = CGPointZero;
        
        // Last two views are at the bottom
        if (i > 1) {
            frame.origin.y = boundsSize.height - self.radius;
        }

        // 2nd and 3rd views are on the right
        if (i == 1 || i == 2) {
            frame.origin.x = boundsSize.width - self.radius;
        }

        view.frame = frame;
    }
}

#pragma mark - Image Creation -
+ (UIImage *)cornerImageWithRadius:(CGFloat)radius
{
    UIImage *image = nil;
    CGRect frame = (CGRect){0,0,radius,radius};
    
    UIGraphicsBeginImageContextWithOptions(frame.size, NO, 0.0f);
    {
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 1.00000 * frame.size.width, CGRectGetMinY(frame) + 0.00062 * frame.size.height)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.63149 * frame.size.width, CGRectGetMinY(frame) + 0.07491 * frame.size.height) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.86209 * frame.size.width, CGRectGetMinY(frame) + 0.01907 * frame.size.height) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.74886 * frame.size.width, CGRectGetMinY(frame) + 0.03780 * frame.size.height)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.07491 * frame.size.width, CGRectGetMinY(frame) + 0.63149 * frame.size.height) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.37282 * frame.size.width, CGRectGetMinY(frame) + 0.16906 * frame.size.height) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.16906 * frame.size.width, CGRectGetMinY(frame) + 0.37282 * frame.size.height)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.06550 * frame.size.width, CGRectGetMinY(frame) + 0.66993 * frame.size.height)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.00873 * frame.size.width, CGRectGetMinY(frame) + 1.00000 * frame.size.height) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.03345 * frame.size.width, CGRectGetMinY(frame) + 0.76703 * frame.size.height) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.01709 * frame.size.width, CGRectGetMinY(frame) + 0.86931 * frame.size.height)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.00000 * frame.size.width, CGRectGetMinY(frame) + 0.00000 * frame.size.height) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.00000 * frame.size.width, CGRectGetMinY(frame) + 1.00000 * frame.size.height) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.00000 * frame.size.width, CGRectGetMinY(frame) + 0.00000 * frame.size.height)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 1.00000 * frame.size.width, CGRectGetMinY(frame) + 0.00000 * frame.size.height)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 1.00000 * frame.size.width, CGRectGetMinY(frame) + 0.00062 * frame.size.height)];
        [bezierPath closePath];
        [UIColor.blackColor setFill];
        [bezierPath fill];
        
        image = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark - Accessors -
- (void)setCornerAlpha:(CGFloat)cornerAlpha
{
    if (cornerAlpha == _cornerAlpha) { return; }
    _cornerAlpha = cornerAlpha;
    
    for (UIImageView *imageView in self.cornerViews) {
        imageView.alpha = cornerAlpha;
    }
}

#pragma mark - Presentation -

+ (void)show
{
    [TORoundedWindow showWithCornerRadius:8.0f];
}

+ (void)showWithCornerRadius:(CGFloat)radius
{
    if (_sharedWindow) { return; }
    _sharedWindow = [[TORoundedWindow alloc] initWithCornerRadius:radius];
    _sharedWindow.hidden = NO;
}

+ (void)setHidden:(BOOL)hidden animated:(BOOL)animated
{
    if (_sharedWindow.hidden == hidden) { return; }
    
    if (!animated) {
        _sharedWindow.hidden = hidden;
        return;
    }
    
    _sharedWindow.hidden = NO;
    
    _sharedWindow.cornerAlpha = hidden ? 1.0f : 0.0f;
    [UIView animateWithDuration:0.4f animations:^{
        _sharedWindow.cornerAlpha = hidden ? 0.0f : 1.0f;
    } completion:^(BOOL finished) {
        _sharedWindow.hidden = hidden;
    }];
}

+ (BOOL)hidden { return _sharedWindow.hidden; }

+ (void)remove
{
    _sharedWindow.hidden = YES;
    _sharedWindow = nil;
}

@end
