//
//  NSString+m3u8.h
//  M3U8Kit
//
//  Created by Oneday on 13-1-11.
//  Copyright (c) 2013年 0day. All rights reserved.
//

#import <Foundation/Foundation.h>

@class M3U8SegmentInfoList;
@interface NSString (m3u8)

- (M3U8SegmentInfoList *)m3u8SegementInfoListValue;

@end
