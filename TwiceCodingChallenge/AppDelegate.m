//
//  AppDelegate.m
//  TwiceCodingChallenge
//
//  Created by Kostia Dombrovsky on 11.4.14.
//  Copyright (c) 2014 Kostia Dombrovsky. All rights reserved.
//

#import "AppDelegate.h"
#import "DictionaryWordsParser.h"
#import "WordsGenerator.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    DictionaryWordsParser* parser = [DictionaryWordsParser new];
    [parser parseWords];

    //TODO pass parsed words array to check words on the fly
    NSMutableSet* generatedWords = [[[WordsGenerator new] generateWordsFromCharacters: @"ab"] mutableCopy];
    [generatedWords intersectSet: parser.words];

    NSLog(@"words = %@", generatedWords);
    return YES;
}

@end
