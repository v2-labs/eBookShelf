/*
 * hashID.c
 * eBookShelf
 *
 * Created by Juvenal A. Silva Jr. <juvenal.silva@mac.com>
 * Copyright (c) 2013 v2 labs. All rights reserved
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

#include "hashID.h"

/**
 *
 *
 *
 *
 *
 *
 *
 *
 *
 */
char *findHashOfFile(char *result, const char *pathname) {
	SHA1Context   sha;
	FILE          *fp;
	unsigned char c;

	/* Open given pathname for binary reading */
	if (!(fp = fopen(pathname, "rb"))) {
		return NULL;
	}
	/* Reset SHA-1 context and process input */
	SHA1Reset(&sha);
	/* Walk thru the file calculating hash */
	c = fgetc(fp);
	while (!feof(fp)) {
		SHA1Input(&sha, &c, 1);
		c =fgetc(fp);
	}
	/* Check proper result and fill it to return */
	if (SHA1Result(&sha) != 0) {
		return NULL;
	}
	else {
		sprintf(result,"%08X%08X%08X%08X%08X",
				sha.Message_Digest[0],
				sha.Message_Digest[1],
				sha.Message_Digest[2],
				sha.Message_Digest[3],
				sha.Message_Digest[4]);
	}
	return result;
}

/**
 *
 *
 *
 *
 *
 *
 *
 *
 *
 */
char *checkHashOfFile(char *result, const char *pathname, const char *checkHash) {
	char *hashFound;

	hashFound = (char *)malloc((size_t)HASH_SIZE);
	findHashOfFile(hashFound, pathname);
	if (strlen(hashFound) == 0) {
		/* Prepare return to log error on hash calculation */
		strncpy(result, "FAIL1", 6);
	}
	else {
		if (strncmp(hashFound, checkHash, HASH_SIZE) != 0) {
			/* Prepare return to inform hash doesn't match */
			strncpy(result, "FAIL2", 6);
		}
		else {
			/* Prepare return to inform that hashes match */
			strncpy(result, "SUCCESS", 8);
		}
	}
	free((void *)hashFound);
	return result;
}
