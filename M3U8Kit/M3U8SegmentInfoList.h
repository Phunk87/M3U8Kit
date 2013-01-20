//
//  M3U8SegmentInfoList.h
//  M3U8Kit
//
//  Created by Oneday on 13-1-11.
//  Copyright (c) 2013年 0day. All rights reserved.
//

#import <Foundation/Foundation.h>

@class M3U8SegmentInfo;
@interface M3U8SegmentInfoList : NSObject
<
NSCopying
>

@property (nonatomic, assign ,readonly) NSUInteger count;

- (void)addSegementInfo:(M3U8SegmentInfo *)segment;
- (M3U8SegmentInfo *)segmentInfoAtIndex:(NSUInteger)index;

@end
