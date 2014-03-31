//
//  hashID.h
//  eBookShelf
//
//  Created by Juvenal A. Silva Jr. on 7/11/13.
//  Copyright (c) 2013 v2 Software. All rights reserved.
//

#ifndef eBookShelf_hashID_h
#define eBookShelf_hashID_h

#include <stdio.h>

char *findHashOfFile(const char *pathname);
char *checkHashOfFile(const char *pathname);

#endif
