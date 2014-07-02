//
//  eBookShelf
//  V2BSMainLibraryToolbarDelegate.h
//
//  Created by Juvenal A. Silva Jr. on 6/30/14.
//  Copyright (c) 2014 v2 lab. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface V2BSMainLibraryToolbarDelegate: NSObject <NSToolbarDelegate>

	// NSToolbarDelegate protocol methods
	-(NSToolbarItem *) toolbar: (NSToolbar *) toolbar
		  itemForItemIdentifier: (NSString *) itemIdentifier
	  willBeInsertedIntoToolbar: (BOOL) flag;

	-(NSArray *) toolbarAllowedItemIdentifiers: (NSToolbar *) toolbar;

	-(NSArray *) toolbarDefaultItemIdentifiers: (NSToolbar *) toolbar;

	-(NSArray *) toolbarSelectableItemIdentifiers: (NSToolbar *) toolbar;

@end
