//
//  XJATAMainViewController.m
//  XJARCTestApp
//
//  Created by XJones on 12/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "XJATAMainViewController.h"

@implementation XJATAMainViewController

#pragma mark - View lifecycle

- (void)loadView
{
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    view.backgroundColor = [UIColor darkGrayColor];
    self.view = view;
    
    UIButton *flipButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
    [flipButton addTarget:self action:@selector(showInfo:) forControlEvents:UIControlEventTouchUpInside];
    CGRect flipButtonFrame = flipButton.frame;
    flipButtonFrame.origin = CGPointMake(280, 400);
    flipButton.frame = flipButtonFrame;
    [self.view addSubview:flipButton];
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(XJATAFlipsideViewController *)controller
{
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)showInfo:(id)sender
{    
    XJATAFlipsideViewController *controller = [[XJATAFlipsideViewController alloc] init];
    controller.delegate = self;
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];
}

@end
