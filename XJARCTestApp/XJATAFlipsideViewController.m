//
//  XJATAFlipsideViewController.m
//  XJARCTestApp
//
//  Created by XJones on 12/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "XJATAFlipsideViewController.h"
#import <objc/runtime.h>
#import <execinfo.h>

@implementation XJATAFlipsideViewController

@synthesize delegate = _delegate,
            actionsController = _actionsController;

+ (void)load
{
	unsigned int method_count;
	Method *methods = class_copyMethodList(self, &method_count);

	printf("Method list for class '%s'\n", class_getName(self));

	for (unsigned int method_index = 0; method_index < method_count; method_index++) {
		SEL selector = method_getName(methods[method_index]);
		printf("- %s\n", sel_getName(selector));
	}

	SEL forbiddenFruit = NSSelectorFromString(@".cxx_destruct");

	IMP originalDestructor = class_getMethodImplementation(self, forbiddenFruit);

	void (^destructorBlock)(id self, SEL _cmd) = [^(id self, SEL _cmd) {
		NSLog(@"Replacemetn destructor");

		void *callStack[128];
		int stackSize = backtrace(callStack, sizeof(callStack));
		backtrace_symbols_fd(callStack, stackSize, STDERR_FILENO);

		originalDestructor(self, _cmd);
	} copy];
	
	IMP replacementDestructor = imp_implementationWithBlock((__bridge void *)destructorBlock);

	class_replaceMethod(self, forbiddenFruit, replacementDestructor, method_getTypeEncoding(class_getInstanceMethod(self, forbiddenFruit)));
}

- (id)init
{
    self = [super init];
    if (self) {
        _actionsController = [[XJATAActionsController alloc] init];
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

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

@end
