//
//  WordsGenerator.h
//  TwiceCodingChallenge
//
//  Created by Kostia Dombrovsky on 11.4.14.
//  Copyright 2009-2013 Kostia Dombrovsky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WordsGenerator : NSObject
{
}

- (NSSet*) generateWordsFromCharacters: (NSString*) characters;

@end