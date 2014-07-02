/*
 * eBookShelf
 * V2BSAppDelegate.m
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

#import "V2BSAppDelegate.h"
#import "V2BSMainWindowController.h"

@implementation V2BSAppDelegate
	@synthesize mainWindow;

	// Implement your own initialization steps after application launch
	-(void) applicationDidFinishLaunching: (NSNotification *) aNotification
	{
		// Insert code here to initialize your application
		V2BSMainWindowController *windowController;
		windowController = [[V2BSMainWindowController alloc] initWithWindowNibName: @"MainWindow"];
		[windowController showWindow: nil];
		self.mainWindow = windowController;
	}

	// Implement your own finalization steps before application finishes
	-(void) applicationWillTerminate: (NSNotification *) aNotification
	{
		/* Insert code here to finalize your application */
	}

	// Implement method definition for newBookShelf
	-(IBAction) newBookShelf: (id) sender
	{
		/* ... */
	}

@end

