//
//  eBookShelf
//  V2BSMainWindowController.m
//
//  Created by Juvenal A. Silva Jr. on 1/24/14.
//  Copyright (c) 2014 v2 lab. All rights reserved.
//

#import "V2BSMainWindowController.h"

//@interface V2BSMainWindowController ()
//	/* Define private properties */
//	@property (nonatomic, strong) NSArray *sidebarItems;
//
//@end


@implementation V2BSMainWindowController
	/* Synthesize properties' accessors
	@synthesize sidebarItems = _sidebarItems; */

	/* initWithWindow method */
	- (id) initWithWindow: (NSWindow *)window {
		self = [super initWithWindow: window];
		if (self) {
			// Initialization code here.
			/*
			_sidebarItems = [NSArray arrayWithObjects:
							    [NSDictionary dictionaryWithObjectsAndKeys: @"BUZZ!", @"title",
							        [NSArray arrayWithObjects:
									    [NSDictionary dictionaryWithObject: @"Campain" forKey: @"title"],
							            [NSDictionary dictionaryWithObject: @"Reaction" forKey: @"title"],
							            nil],
							        @"children",
							        [NSNumber numberWithBool: YES], @"header",
							        nil],
							    [NSDictionary dictionaryWithObjectsAndKeys: @"HEALTH", @"title",
							        [NSArray arrayWithObjects:
								        [NSDictionary dictionaryWithObject: @"Audience" forKey: @"title"],
								        [NSDictionary dictionaryWithObject: @"Expand" forKey: @"title"],
								        nil],
							        @"children",
							        [NSNumber numberWithBool: YES], @"header",
							        nil],
							nil]; */
		}
		return self;
	}

	// windowDidLoad method
	-(void) windowDidLoad {
		[super windowDidLoad];
		/* Implement this method to handle any initialization after your window controller's window
		   has been loaded from its nib file. */
	}

@end
