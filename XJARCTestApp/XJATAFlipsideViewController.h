//
//  XJATAFlipsideViewController.h
//  XJARCTestApp
//
//  Created by XJones on 12/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XJATAActionsController.h"

@class XJATAFlipsideViewController;

@protocol XJATAFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(XJATAFlipsideViewController *)controller;
@end

@interface XJATAFlipsideViewController : UIViewController

@property (unsafe_unretained, nonatomic) IBOutlet id <XJATAFlipsideViewControllerDelegate> delegate;
@property (nonatomic, strong)           XJATAActionsController *    actionsController;

- (IBAction)done:(id)sender;

@end
