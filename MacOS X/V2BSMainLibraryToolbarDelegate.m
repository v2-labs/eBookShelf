//
//  eBookShelf
//  V2BSMainLibraryToolbarDelegate.m
//
//  Created by Juvenal A. Silva Jr. on 6/30/14.
//  Copyright (c) 2014 v2 lab. All rights reserved.
//

#import "V2BSMainLibraryToolbarDelegate.h"
#import "V2BSMainWindowCOntroller.h"

@interface V2BSMainLibraryToolbarDelegate()
	// Set delegate private properties
	@property (strong) NSArray      *toolbarNames;
	@property (strong) NSDictionary *toolbarItems;
@end

@implementation V2BSMainLibraryToolbarDelegate
	@synthesize toolbarNames;
	@synthesize toolbarItems;

	// Initializer
	-(id) init
	{
		self = [super init];
		if (self) {
			self.toolbarNames = @[@"newShelf",
								  @"newCollection",
								  @"newSmartCollection",
								  @"setPreferences",
								  @"openInfo"];

			self.toolbarItems = @{@"newShelf":            @{@"label":    @"New Shelf",
															@"pallete":  @"New Shelf",
															@"tooltip":  @"Creates a new shelf",
															@"image":    @"NSFolder"},

								  @"newCollection":       @{@"label":    @"New Collection",
															@"pallete":  @"New Collection",
															@"tooltip":  @"Creates a new collection",
															@"image":    @"NSMultipleDocuments"},

								  @"newSmartCollection":  @{@"label":    @"Smart Collection",
															@"pallete":  @"Smart Collection",
															@"tooltip":  @"Creates a new smart collection",
															@"image":    @"NSFolderSmart"},

								  @"setPreferences":      @{@"label":    @"Preferences",
															@"pallete":  @"Preferences",
															@"tooltip":  @"Open the preferences pane settings",
															@"image":    @"NSPreferencesGeneral"},

								  @"openInfo":            @{@"label":    @"Open Info",
															@"pallete":  @"Open Info",
															@"tooltip":  @"Open selected item info pane",
															@"image":    @"NSInfo"}};
		}
		return self;
	}

	// NSToolbarDelegate methods
	-(NSToolbarItem *) toolbar: (NSToolbar *) toolbar
		 itemForItemIdentifier: (NSString *) itemIdent
	 willBeInsertedIntoToolbar: (BOOL) flag
	{
		NSToolbarItem *toolbarItem = nil;
		for (id tbItem in self.toolbarNames) {
			if ([itemIdent isEqual: tbItem]) {
				NSDictionary *tbItemData = self.toolbarItems[tbItem];
				toolbarItem = [[NSToolbarItem alloc] initWithItemIdentifier: tbItem];
				[toolbarItem setLabel: tbItemData[@"label"]];
				[toolbarItem setPaletteLabel: tbItemData[@"pallete"]];
				[toolbarItem setToolTip: tbItemData[@"tooltip"]];
				[toolbarItem setImage: [NSImage imageNamed: tbItemData[@"image"]]];
				break;
			}
		}
		return toolbarItem;
	}

	-(NSArray *) toolbarAllowedItemIdentifiers: (NSToolbar *) toolbar
	{
		return @[self.toolbarNames[0],
				 self.toolbarNames[1],
				 self.toolbarNames[2],
				 self.toolbarNames[3],
				 self.toolbarNames[4],
				 NSToolbarSeparatorItemIdentifier,
				 NSToolbarSpaceItemIdentifier,
				 NSToolbarFlexibleSpaceItemIdentifier,
				 NSToolbarCustomizeToolbarItemIdentifier,
				 NSToolbarPrintItemIdentifier];
	}

	-(NSArray *) toolbarDefaultItemIdentifiers: (NSToolbar *) toolbar
	{
		return @[self.toolbarNames[0],
				 self.toolbarNames[1],
				 self.toolbarNames[2],
				 self.toolbarNames[3],
				 NSToolbarFlexibleSpaceItemIdentifier,
				 self.toolbarNames[4]];
	}

	-(NSArray *) toolbarSelectableItemIdentifiers: (NSToolbar *) toolbar
	{
		return @[self.toolbarNames[0],
				 self.toolbarNames[1],
				 self.toolbarNames[2],
				 self.toolbarNames[3],
				 self.toolbarNames[4]];
	}

@end
