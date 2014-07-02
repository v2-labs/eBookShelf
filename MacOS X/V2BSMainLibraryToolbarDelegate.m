//
//  eBookShelf
//  V2BSMainLibraryToolbarDelegate.m
//
//  Created by Juvenal A. Silva Jr. on 6/30/14.
//  Copyright (c) 2014 v2 lab. All rights reserved.
//

#import "V2BSMainLibraryToolbarDelegate.h"

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
			self.toolbarItems = @{@"newShelf" :           @[@"New Shelf",
															@"New Shelf",
															@"Creates a new shelf",
															@"NSFolder"],
								  @"newCollection" :      @[@"New Collection",
															@"New Collection",
															@"Creates a new collection",
															@"NSMultipleDocuments"],
								  @"newSmartCollection" : @[@"Smart Collection",
															@"Smart Collection",
															@"Creates a new smart collection",
															@"NSFolderSmart"],
								  @"setPreferences" :     @[@"Preferences",
															@"Preferences",
															@"Open the preferences pane settings",
															@"NSPreferencesGeneral"],
								  @"openInfo" :           @[@"Open Info",
															@"Open Info",
															@"Open selected item info pane",
															@"NSInfo"]};
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
				NSArray *tbItemData = self.toolbarItems[tbItem];
				toolbarItem = [[NSToolbarItem alloc] initWithItemIdentifier: tbItem];
				[toolbarItem setLabel: tbItemData[0]];
				[toolbarItem setPaletteLabel: tbItemData[1]];
				[toolbarItem setToolTip: tbItemData[2]];
				[toolbarItem setImage: [NSImage imageNamed: tbItemData[3]]];
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
