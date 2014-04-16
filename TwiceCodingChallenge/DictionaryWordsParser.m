//
//  DictionaryWordsParser.m
//  TwiceCodingChallenge
//
//  Created by Kostia Dombrovsky on 15.4.14.
//  Copyright 2009-2013 Kostia Dombrovsky. All rights reserved.
//

#import "DictionaryWordsParser.h"

@interface DictionaryWordsParser ()
@end

@implementation DictionaryWordsParser

- (void) parseWords
{
    NSString* wordsFolder = [[[NSBundle bundleForClass: self.class] resourcePath] stringByAppendingPathComponent: @"Words"];
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSMutableSet* words = [NSMutableSet new];

    char buffer[1024];
    for (NSString* fileName in [fileManager contentsOfDirectoryAtPath: wordsFolder error: nil])
    {
        NSString* filePath = [wordsFolder stringByAppendingPathComponent: fileName];
        FILE* file = fopen(filePath.UTF8String, "r");
        fseek(file, 0, 0);

        while (feof(file) == 0)
        {
            fgets(buffer, 1024, file);
            NSString* word = [NSString stringWithCString: buffer encoding: NSUTF8StringEncoding];
            word = [word stringByTrimmingCharactersInSet: NSCharacterSet.whitespaceAndNewlineCharacterSet];
            if (word.length)
                [words addObject: word];

            if ([word isEqualToString: @"ba"])
                NSLog(@"fileName = %@", fileName);
        }

        fclose(file);
    }
    self.words = words;
}

@end