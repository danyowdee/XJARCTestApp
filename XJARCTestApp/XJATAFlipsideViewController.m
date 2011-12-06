//
//  XJATAFlipsideViewController.m
//  XJARCTestApp
//
//  Created by XJones on 12/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "XJATAFlipsideViewController.h"

@implementation XJATAFlipsideViewController

@synthesize delegate = _delegate,
            actionsController = _actionsController;

- (id)init
{
    self = [super init];
    if (self) {
        _actionsController = [XJATAActionsController new];
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"XJATAFlipsideVC:dealloc");
}

#pragma mark - View lifecycle

- (void)loadView
{
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    view.backgroundColor = [UIColor lightGrayColor];
    view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    self.view = view;
    
    UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [doneButton setTitle:@"Done" forState:UIControlStateNormal];
    [doneButton addTarget:self action:@selector(done:) forControlEvents:UIControlEventTouchUpInside];
    [doneButton sizeToFit];
    
    CGRect doneButtonFrame = doneButton.frame;
    doneButtonFrame.origin = CGPointMake(CGRectGetMidX(self.view.bounds) - CGRectGetMidX(doneButtonFrame), CGRectGetMidY(self.view.bounds) - CGRectGetMidY(doneButtonFrame));
    doneButton.frame = doneButtonFrame;
    [self.view addSubview:doneButton];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

@end
