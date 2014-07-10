/*
 * sha1.h
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


#ifndef eBookShelf_sha1_h
#define eBookShelf_sha1_h

/* This structure will hold context information for the hashing */
/* operation                                                    */
typedef struct SHA1Context {
    unsigned int Message_Digest[5];  /* Message Digest (output) */
    unsigned int Length_Low;         /* Message length in bits */
    unsigned int Length_High;        /* Message length in bits */
    unsigned char Message_Block[64]; /* 512-bit message blocks */
    int Message_Block_Index;         /* Index into message block array */
    int Computed;                    /* Is the digest computed? */
    int Corrupted;                   /* Is the message digest corruped? */
} SHA1Context;

/* Function Prototypes */
void SHA1Reset(SHA1Context *);
int  SHA1Result(SHA1Context *);
void SHA1Input(SHA1Context *, const unsigned char *, unsigned);

#endif
