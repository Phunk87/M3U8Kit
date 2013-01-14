//
//  NSString+m3u8.m
//  M3U8Kit
//
//  Created by Oneday on 13-1-11.
//  Copyright (c) 2013年 0day. All rights reserved.
//

#import "NSString+m3u8.h"
#import "M3U8SegmentInfo.h"
#import "M3U8SegmentInfoList.h"

@implementation NSString (m3u8)

- (M3U8SegmentInfoList *)m3u8SegementInfoListValue {
    // self == @""
    if (0 == self.length)
        return nil;
    
    /**
     The Extended M3U file format defines two tags: EXTM3U and EXTINF.  An
     Extended M3U file is distinguished from a basic M3U file by its first
     line, which MUST be #EXTM3U.
     
     reference url:http://tools.ietf.org/html/draft-pantos-http-live-streaming-00
     */
    NSString *m3u8FirstTag = @"#EXTM3U";
    NSRange rangeOfEXTM3U = [self rangeOfString:m3u8FirstTag];
    if (rangeOfEXTM3U.location == NSNotFound ||
        rangeOfEXTM3U.location != 0) {
        return nil;
    }
    
    M3U8SegmentInfoList *segmentInfoList = [[M3U8SegmentInfoList alloc] init];
    
    NSString *extinfoString = @"#EXTINF:";
    NSRange segmentRange = [self rangeOfString:extinfoString];
    NSString *remainingSegments = self;
    
    while (NSNotFound != segmentRange.location) {
        NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
        
		// Read the EXTINF number between #EXTINF: and the comma
		NSRange commaRange = [remainingSegments rangeOfString:@","];
		NSString *value = [remainingSegments substringWithRange:NSMakeRange(segmentRange.location + 8, commaRange.location - (segmentRange.location + 8))];
		[params setValue:value forKey:keyM3U8SegmentDuration];
        
        // ignore the #EXTINF line
        remainingSegments = [remainingSegments substringFromIndex:segmentRange.location];
        NSRange extinfoLFRange = [remainingSegments rangeOfString:@"\n"];
        remainingSegments = [remainingSegments substringFromIndex:extinfoLFRange.location + 1];
        
        // Read the segment link, and ignore line start with # && blank line
        while (1) {
            NSRange lfRange = [remainingSegments rangeOfString:@"\n"];
            NSString *line = [remainingSegments substringWithRange:NSMakeRange(0, lfRange.location)];
            line = [line stringByReplacingOccurrencesOfString:@" " withString:@""];
            
            remainingSegments = [remainingSegments substringFromIndex:lfRange.location + 1];
            
            if ([line characterAtIndex:0] != '#' && 0 != line.length) {
                // remove the CR character '\r'
                char lastChar = [line characterAtIndex:line.length - 1];
                if (lastChar == '\r') {
                    line = [line substringToIndex:line.length - 1];
                }
                
                [params setValue:line forKey:keyM3U8SegmentMediaURLString];
                break;
            }
        }
        
        M3U8SegmentInfo *segment = [[M3U8SegmentInfo alloc] initWithDictionary:params];
        [segmentInfoList addSegementInfo:segment];
        
        [segment release];
        [params release];
        
		segmentRange = [remainingSegments rangeOfString:extinfoString];
    }
    
    return segmentInfoList;
}

@end
