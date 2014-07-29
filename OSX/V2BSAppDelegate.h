/*
 * eBookShelf
 * V2BSAppDelegate.h
 *
 * Created by Juvenal A. Silva Jr. <juvenal.silva@mac.com>
 * Copyright (c) 2014 v2 labs. All rights reserved
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 * MA 02110-1301, USA.
 *
 *
 */

#import <Cocoa/Cocoa.h>
#import <ParseOSX/Parse.h>

@class V2BSMainWindowController;
@class V2BSBookShelf;

@interface V2BSAppDelegate: NSObject <NSApplicationDelegate>
	@property (retain) V2BSMainWindowController *mainWindow;
	@property (retain) V2BSBookShelf *bookShelf;

	-(IBAction) newBookShelf: (id) sender;
@end
