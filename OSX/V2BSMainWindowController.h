//
//  eBookShelf
//  V2BSMainWindowController.h
//
//  Created by Juvenal A. Silva Jr. on 1/24/14.
//  Copyright (c) 2014 v2 lab. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Quartz/Quartz.h>

@interface V2BSMainWindowController: NSWindowController <NSToolbarDelegate>
    @property (atomic, strong, retain) IBOutlet NSArray *sidebarItems;

    #pragma mark NSToolbarDelegate methods
    // NSToolbarDelegate protocol methods
    -(NSToolbarItem *) toolbar: (NSToolbar *) toolbar
         itemForItemIdentifier: (NSString *) itemIdentifier
     willBeInsertedIntoToolbar: (BOOL) flag;
    -(NSArray *) toolbarAllowedItemIdentifiers: (NSToolbar *) toolbar;
    -(NSArray *) toolbarDefaultItemIdentifiers: (NSToolbar *) toolbar;
    -(NSArray *) toolbarSelectableItemIdentifiers: (NSToolbar *) toolbar;

@end

