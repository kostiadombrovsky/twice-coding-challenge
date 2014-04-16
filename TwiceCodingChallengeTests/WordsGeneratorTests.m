//
//  WordsGeneratorTests.m
//  WordsGeneratorTests
//
//  Created by Kostia Dombrovsky on 11.4.14.
//  Copyright (c) 2014 Kostia Dombrovsky. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "WordsGenerator.h"

@interface WordsGeneratorTests : XCTestCase
{
    WordsGenerator* _wordsGenerator;
}

@end

@implementation WordsGeneratorTests

- (void) setUp
{
    [super setUp];
    _wordsGenerator = [WordsGenerator new];
}

- (void) tearDown
{
    [super tearDown];
}

- (void) testGenerateWordsFromAB
{
    NSSet* words = [_wordsGenerator generateWordsFromCharacters: @"ab"];
    XCTAssertTrue(words.count == 4);
    XCTAssertTrue([words containsObject: @"ab"]);
    XCTAssertTrue([words containsObject: @"ba"]);
    XCTAssertTrue([words containsObject: @"a"]);
    XCTAssertTrue([words containsObject: @"b"]);
}

- (void) testGenerateWordsFromDog
{
    NSSet* words = [_wordsGenerator generateWordsFromCharacters: @"dog"];
    XCTAssertTrue([words containsObject: @"dog"]);
    XCTAssertTrue([words containsObject: @"odg"]);
    XCTAssertTrue([words containsObject: @"god"]);
    XCTAssertTrue([words containsObject: @"do"]);
    XCTAssertTrue([words containsObject: @"go"]);
}

@end
