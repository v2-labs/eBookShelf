//
//  eBookShelf
//  V2BSMainWindowController.m
//
//  Created by Juvenal A. Silva Jr. on 1/24/14.
//  Copyright (c) 2014 v2 lab. All rights reserved.
//

#import "V2BSMainWindowController.h"
#import "V2BSMainLibraryToolbarDelegate.h"

//@interface V2BSMainWindowController ()
//	/* Define private properties */
//	@property (nonatomic, strong) NSArray *sidebarItems;
//
//@end

@implementation V2BSMainWindowController
	// Synthesize properties' accessors
	@synthesize toolbarDelegate = _toolbarDelegate;
	@synthesize sidebar = _sidebar;
    @synthesize sidebarItems = _sidebarItems;

    // This forward events to _toolbarDelegate to fix the issue below.
    // [FIXED]
    //    - The ToolbarDelegate protocol must be attached to the main window controller
    //      where it's supposed to be displayed (that seems to be the case here, as we
    //      had defined it in an isolated class that is anexed to the main window controller
    //      but when the event loop sends a default "hide" and/or "show" toolbar to the
    //      main window controller, the application crashes, as this message is directed
    //      to the main window controller, not the isolated delegate object.
    // [OPTIMIZEME]
    //    - This code is helpfull to solve the missing method invocation explained above,
    //      but it needs improvement, maybe by adding the protocol ToolbarDelegate to the
    //      mainWindow class (which everybody else seems to do). I'll let this reminder
    //      here to keep a note for some future change.
	-(void) forwardInvocation: (NSInvocation *)invocation
	{
		SEL aSelector = [invocation selector];

		if ([_toolbarDelegate respondsToSelector: aSelector]) {
			[invocation invokeWithTarget: _toolbarDelegate];
		}
		else {
			[super forwardInvocation: invocation];
		}
	}

	// awakeFromNib method
	-(void) awakeFromNib
	{
		// Init the library toolbar delegate to use
		_toolbarDelegate = [[V2BSMainLibraryToolbarDelegate alloc] init];
		// Proceed with toolbar creation
		NSToolbar *toolbar = [[NSToolbar alloc]
							  initWithIdentifier: @"mainLibraryToolbar"];
		[toolbar setDisplayMode: NSToolbarDisplayModeIconAndLabel];
		[toolbar setSizeMode: NSToolbarSizeModeSmall];
		[toolbar setAllowsUserCustomization: YES];
		[toolbar setAutosavesConfiguration: YES];
		[toolbar setDelegate: _toolbarDelegate];
		// Attach toolbar to main library window
		[self.window setToolbar: toolbar];
	}

	// initWithWindow method
	-(id) initWithWindow: (NSWindow *)window
	{
		self = [super initWithWindow: window];
		if (self) {
			// Initialization code here.
			//
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
							nil];
		}
		return self;
	}

	// windowWillLoad method
	-(void) windowWillLoad {
		[super windowWillLoad];
		/* Implement this method to handle any initialization before your window controller's window
		   has been loaded from its nib file. */
	}

	// windowDidLoad method
	-(void) windowDidLoad {
		[super windowDidLoad];
		/* Implement this method to handle any initialization after your window controller's window
		   has been loaded from its nib file. */
	}

@end
