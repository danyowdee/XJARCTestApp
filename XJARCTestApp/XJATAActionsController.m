//
//  XJATAActionsController.m
//  XJARCTestApp
//
//  Created by XJones on 12/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "XJATAActionsController.h"
#import <execinfo.h>

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

	void *call_stack[128];
	int actual_size = backtrace(call_stack, sizeof(call_stack));

	backtrace_symbols_fd(call_stack, actual_size, STDERR_FILENO);
}

@end
