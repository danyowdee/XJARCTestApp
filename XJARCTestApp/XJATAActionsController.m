//
//  XJATAActionsController.m
//  XJARCTestApp
//
//  Created by XJones on 12/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "XJATAActionsController.h"

@implementation XJATAActionsController

- (id)init
{
    self = [super init];
    if (self) {
        NSLog(@"XJATAActionsController:init");
        // OBSERVE SOME NOTIFICATIONS
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"XJATAActionsController:dealloc");
    // STOP OBSERVING NOTIFICATIONS
}

@end
