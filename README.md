# M3U8Kit

M3U8Kit is a light-weight m3u8 parser framework, code in Objective-C.  
M3U8Kit 是使用Objective-C编写的一套轻量级m3u8解析框架.

## Usage 使用方法

### Get m3u8 plan string 获取m3u8明文
```
NSString *planString = [m3u8LocationURL m3u8PlanString];
```

### Parse m3u8 from plan string or data 从明文或者data中解析m3u8
```
M3U8SegmentInfoList *m3u8 = [M3U8Parser m3u8SegmentInfoListFromPlanString:m3u8PlanString];

M3U8SegmentInfoList *m3u8 = [M3U8Parser m3u8SegmentInfoListFromData:m3u8Data];
```

## Support Tags 支持的Tags
* #EXTM3U
* #EXTINF

## Reference link 参考链接
### HTTP Live Streaming  
http://tools.ietf.org/html/draft-pantos-http-live-streaming-00

## Donate 捐赠

You can donate me
via:
* [Alipay | 支付宝](https://me.alipay.com/0dayzh)

## License 许可协议
This code is distributed under the terms of the GNU General Public License.  
代码使用 GNU General Public License 许可发布.
