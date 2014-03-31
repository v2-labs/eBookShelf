/*
 * V2BSAppDelegate.m
 * eBookShelf
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

@implementation V2BSAppDelegate

	@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;
	@synthesize managedObjectModel = _managedObjectModel;
	@synthesize managedObjectContext = _managedObjectContext;
	
	
	- (void) applicationDidFinishLaunching: (NSNotification *)aNotification
	{
		/* Insert code here to initialize your application */
	}
	
	
	/* 
	 * Returns the directory the application uses to store the Core Data store file.
	 * This code uses a directory named "br.com.v2apps.VirgoVue" in the user's Application Support directory.
	 */
	- (NSURL *) applicationFilesDirectory
	{
		NSFileManager *fileManager = [NSFileManager defaultManager];
		NSURL *appSupportURL = [[fileManager URLsForDirectory: NSApplicationSupportDirectory
													inDomains: NSUserDomainMask] lastObject];
		return [appSupportURL URLByAppendingPathComponent: @"br.com.v2apps.VirgoVue"];
	}
	
	
	/*
	 * Creates if necessary and returns the managed object model for the application.
	 */
	- (NSManagedObjectModel *) managedObjectModel
	{
		if (_managedObjectModel) {
			return _managedObjectModel;
		}
		
		NSURL *modelURL = [[NSBundle mainBundle] URLForResource: @"VirgoVue"
												  withExtension: @"momd"];
		_managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL: modelURL];
		return _managedObjectModel;
	}
	
	
	/* 
	 * Returns the persistent store coordinator for the application.
	 * This implementation creates and return a coordinator, having added the store for the application to it.
	 * (The directory for the store is created, if necessary.)
	 */
	- (NSPersistentStoreCoordinator *) persistentStoreCoordinator
	{
		if (_persistentStoreCoordinator) {
			return _persistentStoreCoordinator;
		}
		
		NSManagedObjectModel *mom = [self managedObjectModel];
		if (!mom) {
			NSLog(@"%@:%@ No model to generate a store from", [self class], NSStringFromSelector(_cmd));
			return nil;
		}
		
		NSFileManager *fileManager = [NSFileManager defaultManager];
		NSURL *applicationFilesDirectory = [self applicationFilesDirectory];
		NSError *error = nil;
		
		NSDictionary *properties = [applicationFilesDirectory resourceValuesForKeys: @[NSURLIsDirectoryKey]
																			  error: &error];

		if (!properties) {
			BOOL ok = NO;
			if ([error code] == NSFileReadNoSuchFileError) {
				ok = [fileManager createDirectoryAtPath: [applicationFilesDirectory path]
							withIntermediateDirectories: YES
											 attributes: nil
												  error: &error];
			}
			if (!ok) {
				[[NSApplication sharedApplication] presentError: error];
				return nil;
			}
		}
		else {
			if (![properties[NSURLIsDirectoryKey] boolValue]) {
				/* Customize and localize this error. */
				NSString *failureDescription = [NSString stringWithFormat: @"Expected a folder to store application data, found a file (%@).", [applicationFilesDirectory path]];
				
				NSMutableDictionary *dict = [NSMutableDictionary dictionary];
				[dict setValue: failureDescription
						forKey: NSLocalizedDescriptionKey];
				error = [NSError errorWithDomain: @"YOUR_ERROR_DOMAIN"
											code: 101
										userInfo: dict];
				
				[[NSApplication sharedApplication] presentError: error];
				return nil;
			}
		}
		
		NSURL *url = [applicationFilesDirectory URLByAppendingPathComponent: @"VirgoVue.storedata"];
		NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: mom];
		if (![coordinator addPersistentStoreWithType: NSXMLStoreType
									   configuration: nil
												 URL: url
											 options: nil
											   error: &error]) {
			[[NSApplication sharedApplication] presentError: error];
			return nil;
		}
		_persistentStoreCoordinator = coordinator;
		
		return _persistentStoreCoordinator;
	}
	
	
	/* 
	 * Returns the managed object context for the application (which is already bound to
	 * the persistent store coordinator for the application.)
	 */
	- (NSManagedObjectContext *) managedObjectContext
	{
		if (_managedObjectContext) {
			return _managedObjectContext;
		}
		
		NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
		if (!coordinator) {
			NSMutableDictionary *dict = [NSMutableDictionary dictionary];
			[dict setValue: @"Failed to initialize the store"
					forKey: NSLocalizedDescriptionKey];
			[dict setValue: @"There was an error building up the data file."
					forKey: NSLocalizedFailureReasonErrorKey];
			NSError *error = [NSError errorWithDomain: @"YOUR_ERROR_DOMAIN"
												 code: 9999
											 userInfo: dict];
			[[NSApplication sharedApplication] presentError: error];
			return nil;
		}
		_managedObjectContext = [[NSManagedObjectContext alloc] init];
		[_managedObjectContext setPersistentStoreCoordinator: coordinator];
		
		return _managedObjectContext;
	}
	
	
	/*
	 * Returns the NSUndoManager for the application.
	 * In this case, the manager returned is that of the managed object context for the application.
	 */
	- (NSUndoManager *) windowWillReturnUndoManager: (NSWindow *)window
	{
		return [[self managedObjectContext] undoManager];
	}
	
	
	/*
	 * Performs the save action for the application, which is to send the save: message
	 * to the application's managed object context. Any encountered errors are presented to the user.
	 */
	- (IBAction) saveAction: (id)sender
	{
		NSError *error = nil;
		
		if (![[self managedObjectContext] commitEditing]) {
			NSLog(@"%@:%@ unable to commit editing before saving", [self class], NSStringFromSelector(_cmd));
		}
		
		if (![[self managedObjectContext] save: &error]) {
			[[NSApplication sharedApplication] presentError: error];
		}
	}
	
	
	- (NSApplicationTerminateReply) applicationShouldTerminate: (NSApplication *)sender
	{
		/* Save changes in the application's managed object context before the application terminates. */
		if (!_managedObjectContext) {
			return NSTerminateNow;
		}
		
		if (![[self managedObjectContext] commitEditing]) {
			NSLog(@"%@:%@ unable to commit editing to terminate", [self class], NSStringFromSelector(_cmd));
			return NSTerminateCancel;
		}
		
		if (![[self managedObjectContext] hasChanges]) {
			return NSTerminateNow;
		}
		
		NSError *error = nil;
		if (![[self managedObjectContext] save: &error]) {
			
			/* Customize this code block to include application-specific recovery steps. */
			BOOL result = [sender presentError: error];
			if (result) {
				return NSTerminateCancel;
			}
			
			NSString *question = NSLocalizedString(@"Could not save changes while quitting. Quit anyway?", @"Quit without saves error question message");
			NSString *info = NSLocalizedString(@"Quitting now will lose any changes you have made since the last successful save", @"Quit without saves error question info");
			NSString *quitButton = NSLocalizedString(@"Quit anyway", @"Quit anyway button title");
			NSString *cancelButton = NSLocalizedString(@"Cancel", @"Cancel button title");
			NSAlert *alert = [[NSAlert alloc] init];
			[alert setMessageText: question];
			[alert setInformativeText: info];
			[alert addButtonWithTitle: quitButton];
			[alert addButtonWithTitle: cancelButton];
			
			NSInteger answer = [alert runModal];
			
			if (answer == NSAlertAlternateReturn) {
				return NSTerminateCancel;
			}
		}
		
		return NSTerminateNow;
	}

@end
