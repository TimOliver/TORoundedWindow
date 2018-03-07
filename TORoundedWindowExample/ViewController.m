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
    [TORoundedWindow setHidden:![TORoundedWindow hidden] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
