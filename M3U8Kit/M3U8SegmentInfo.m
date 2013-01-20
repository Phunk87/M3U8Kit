//
//  M3U8SegmentInfo.m
//  M3U8Kit
//
//  Created by Oneday on 13-1-11.
//  Copyright (c) 2013年 0day. All rights reserved.
//

#import "M3U8SegmentInfo.h"

NSString *keyM3U8SegmentDuration = @"key.M3U8SegmentDuration";
NSString *keyM3U8SegmentMediaURLString = @"key.M3U8SegmentMediaURLString";

@implementation M3U8SegmentInfo

- (id)initWithDictionary:(NSDictionary *)params {
    self = [super init];
    if (self) {
        [params enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop){
            if ([key isEqualToString:keyM3U8SegmentDuration]) {
                _duration = [obj doubleValue];
            } else if ([key isEqualToString:keyM3U8SegmentMediaURLString]) {
                _mediaURL = [[NSURL alloc] initWithString:obj];
            }
        }];
    }
    
    return self;
}

- (void)dealloc {
    [_mediaURL release];
    [super dealloc];
}

- (NSDictionary *)dictionaryValue {
    NSDictionary *dictionay = [NSDictionary dictionaryWithObjectsAndKeys:
                               [NSNumber numberWithDouble:self.duration], keyM3U8SegmentDuration,
                               _mediaURL == nil ? [NSNull null] : self.mediaURL, keyM3U8SegmentMediaURLString, nil];
    return dictionay;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"SegmentInfo:<duration: %f>, <url:%@>", self.duration, self.mediaURL.absoluteString];
}

- (id)copyWithZone:(NSZone *)zone {
    M3U8SegmentInfo *copy = [[M3U8SegmentInfo alloc] initWithDictionary:[self dictionaryValue]];
    return copy;
}

@end
