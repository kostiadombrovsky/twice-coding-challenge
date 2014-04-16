//
//  WordsGenerator.m
//  TwiceCodingChallenge
//
//  Created by Kostia Dombrovsky on 11.4.14.
//  Copyright 2009-2013 Kostia Dombrovsky. All rights reserved.
//

#import "WordsGenerator.h"

@interface WordsGenerator ()
@end

@implementation WordsGenerator

- (NSSet*) generateWordsFromCharacters: (NSString*) characters
{
    char* cCharacters = calloc(characters.length, sizeof(char));
    strcpy(cCharacters, characters.UTF8String);

    NSMutableSet* words = [NSMutableSet new];
    [self generateWordsFromCharacters: cCharacters till: strlen(cCharacters) words: words];

    free(cCharacters);
    return words;
}

- (void) generateWordsFromCharacters: (char*) chars till: (NSUInteger) n words: (NSMutableSet*) words
{
    NSString* string = [NSString stringWithCString: chars encoding: NSUTF8StringEncoding];
    NSUInteger toIndex = string.length - n;
    if (toIndex)
        [words addObject: [string substringToIndex: toIndex]];

    if (n == 1)
    {
        [words addObject: string];
        return;
    }

    for (NSUInteger i = 0; i < n; i++)
    {
        [self swap: chars index: i with: n - 1];
        [self generateWordsFromCharacters: chars till: n - 1 words: words];
        [self swap: chars index: i with: n - 1];
    }
}

- (void) swap: (char*) string index: (NSUInteger) index with: (NSUInteger) otherIndex
{
    char c = string[index];
    string[index]      = string[otherIndex];
    string[otherIndex] = c;
}

@end