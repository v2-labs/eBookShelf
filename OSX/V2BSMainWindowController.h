//
// eBookShelf
// V2BSMainWindowController.h
//
// Created by Juvenal A. Silva Jr. <juvenal.silva@mac.com>
// Copyright (c) 2014 v2 labs. All rights reserved
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
// MA 02110-1301, USA.
//
//

#import <Cocoa/Cocoa.h>
#import <Quartz/Quartz.h>

@interface V2BSMainWindowController: NSWindowController <NSToolbarDelegate>
    #pragma mark *** 
    @property (atomic, strong, retain) IBOutlet NSArray *sidebarItems;

    #pragma mark *** Main window controller methods
    -(void) setToolbarContent;

    #pragma mark *** NSToolbarDelegate methods
    // NSToolbarDelegate protocol methods
    -(NSToolbarItem *) toolbar: (NSToolbar *) toolbar
         itemForItemIdentifier: (NSString *) itemIdentifier
     willBeInsertedIntoToolbar: (BOOL) flag;
    -(NSArray *) toolbarAllowedItemIdentifiers: (NSToolbar *) toolbar;
    -(NSArray *) toolbarDefaultItemIdentifiers: (NSToolbar *) toolbar;
    -(NSArray *) toolbarSelectableItemIdentifiers: (NSToolbar *) toolbar;

@end

