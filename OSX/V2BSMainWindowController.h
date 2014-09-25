//
//  eBookShelf
//  V2BSMainWindowController.h
//
//  Created by Juvenal A. Silva Jr. on 1/24/14.
//  Copyright (c) 2014 v2 lab. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Quartz/Quartz.h>

@class V2BSMainLibraryToolbarDelegate;

@interface V2BSMainWindowController: NSWindowController
	@property (retain) V2BSMainLibraryToolbarDelegate *toolbarDelegate;
	@property (retain) IBOutlet NSOutlineView *sidebar;
    @property (nonatomic, strong) NSArray *sidebarItems;

@end

