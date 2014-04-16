//
//  DictionaryWordsParser.h
//  TwiceCodingChallenge
//
//  Created by Kostia Dombrovsky on 15.4.14.
//  Copyright 2009-2013 Kostia Dombrovsky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DictionaryWordsParser : NSObject
{
}

@property (nonatomic, strong) NSSet* words;

- (void) parseWords;

@end