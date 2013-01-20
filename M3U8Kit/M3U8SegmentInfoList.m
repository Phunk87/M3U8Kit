//
//  M3U8SegmentInfoList.m
//  M3U8Kit
//
//  Created by Oneday on 13-1-11.
//  Copyright (c) 2013年 0day. All rights reserved.
//

#import "M3U8SegmentInfoList.h"

@implementation M3U8SegmentInfoList {
@private
    NSMutableArray  *_segmentInfoList;
}

- (id)init {
    self = [super init];
    if (self) {
        _segmentInfoList = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    M3U8SegmentInfoList *copy = [[M3U8SegmentInfoList alloc] init];
    
    for (int i = 0; i < [self count]; i++) {
        [copy addSegementInfo:[[self segmentInfoAtIndex:i] copy]];
    }
    
    return copy;
}

- (void)dealloc {
    [_segmentInfoList release];
    [super dealloc];
}

#pragma mark - getter && setter
- (NSUInteger)count {
    return [_segmentInfoList count];
}

#pragma mark - public
- (void)addSegementInfo:(M3U8SegmentInfo *)segment {
    [_segmentInfoList addObject:segment];
}

- (M3U8SegmentInfo *)segmentInfoAtIndex:(NSUInteger)index {
    return [_segmentInfoList objectAtIndex:index];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@", _segmentInfoList];
}

@end
