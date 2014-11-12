//
//  eBookShelf
//  V2BSMainWindowController.m
//
//  Created by Juvenal A. Silva Jr. on 1/24/14.
//  Copyright (c) 2014 v2 lab. All rights reserved.
//

#import "V2BSMainWindowController.h"

// Definition of class' private properties
@interface V2BSMainWindowController ()
    // Define Main window controller private properties
    //@property (atomic, strong, retain) IBOutlet NSToolbar     *toolbar;
    @property (atomic, strong, retain) IBOutlet NSOutlineView *sidebar;
    // Define Toolbar delegate private properties
    @property (strong) NSArray      *toolbarNames;
    @property (strong) NSDictionary *toolbarItems;
@end


@implementation V2BSMainWindowController
    // Synthesize Main window controller properties' accessors
    @synthesize sidebar = _sidebar;
    @synthesize sidebarItems = _sidebarItems;
    // Synthesize Toolbar delegate properties' accessors
    @synthesize toolbarNames = _toolbarNames;
    @synthesize toolbarItems = _toolbarItems;

    #pragma mark *** Main window controller methods
    // awakeFromNib method
    -(void) awakeFromNib
    {
        // Update the toolbar content definition
        [self setToolbarContent];
        // Proceed with toolbar creation
        NSToolbar *toolbar = [[NSToolbar alloc]
                              initWithIdentifier: @"mainLibraryToolbar"];
        [toolbar setDisplayMode: NSToolbarDisplayModeIconOnly];
        [toolbar setSizeMode: NSToolbarSizeModeSmall];
        [toolbar setAllowsUserCustomization: YES];
        [toolbar setAutosavesConfiguration: YES];
        [toolbar setDelegate: self];
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
            self.sidebarItems = [NSArray arrayWithObjects:
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


    #pragma mark *** Complementary method to set up Main window toolbar buttons
    // Initialize Toolbar contents
    -(void) setToolbarContent
    {
        // Set properties used by the Toolbar delegate methods
        self.toolbarNames = @[@"newShelf",
                              @"newCollection",
                              @"newSmartCollection",
                              @"setPreferences",
                              @"openInfo",
                              @"SearchItem"];

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


    #pragma mark *** NSToolbarDelegate related methods
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
        if ([itemIdent isEqualToString:@"SearchItem"]) {
            toolbarItem = [[NSToolbarItem alloc] initWithItemIdentifier: itemIdent];
            NSSearchField *searchField = [[NSSearchField alloc] init];
            [searchField sizeToFit];
            NSRect cellFrame = [searchField frame];
            [toolbarItem setLabel: @"Search"];
            [toolbarItem setPaletteLabel: [toolbarItem label]];
            [toolbarItem setToolTip: @"Search by author, publisher, title, etc..."];
            [toolbarItem setView: searchField];
            [toolbarItem setMinSize: cellFrame.size];
            [toolbarItem setMaxSize: cellFrame.size];
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
                 NSToolbarPrintItemIdentifier,
                 self.toolbarNames[5]];
    }

    -(NSArray *) toolbarDefaultItemIdentifiers: (NSToolbar *) toolbar
    {
        return @[self.toolbarNames[0],
                 self.toolbarNames[1],
                 self.toolbarNames[2],
                 self.toolbarNames[3],
                 self.toolbarNames[4],
                 NSToolbarFlexibleSpaceItemIdentifier,
                 self.toolbarNames[5]];
    }

    -(NSArray *) toolbarSelectableItemIdentifiers: (NSToolbar *) toolbar
    {
        return @[self.toolbarNames[0],
                 self.toolbarNames[1],
                 self.toolbarNames[2],
                 self.toolbarNames[3],
                 self.toolbarNames[4],
                 self.toolbarNames[5]];
    }

@end
