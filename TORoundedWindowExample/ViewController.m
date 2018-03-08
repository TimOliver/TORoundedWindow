//
//  ViewController.m
//  TORoundedWindowExample
//
//  Created by Tim Oliver on 7/3/18.
//  Copyright © 2018 Tim Oliver. All rights reserved.
//

#import "ViewController.h"
#import "TORoundedWindow.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"TORoundedWindow";
    if (@available(iOS 11.0, *)) {
        self.navigationController.navigationBar.prefersLargeTitles = YES;
        self.navigationController.navigationBar.largeTitleTextAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:30.0f weight:UIFontWeightBold]};
    }
    
    UIButton *toggleButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [toggleButton setTitle:@"Hide Rounded Corners" forState:UIControlStateNormal];
    [toggleButton addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [toggleButton sizeToFit];
    toggleButton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin |
                                        UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    toggleButton.center = self.view.center;
    [self.view addSubview:toggleButton];
}

- (void)buttonTapped:(id)sender
{
    BOOL hidden = ![TORoundedWindow hidden];
    [TORoundedWindow setHidden:hidden animated:YES];

    NSString *title = hidden ? @"Show Rounded Corners" : @"Hide Rounded Corners";

    UIButton *toggleButton = (UIButton *)sender;
    [toggleButton setTitle:title forState:UIControlStateNormal];
    [toggleButton sizeToFit];
    toggleButton.center = self.view.center;
}

@end
