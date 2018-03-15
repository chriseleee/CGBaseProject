//
//  NSData+SwitchData.m
//  CGBaseProject
//
//  Created by chrise on 2018/3/15.
//  Copyright © 2018年 chrise. All rights reserved.
//

#import "NSData+SwitchData.h"

@implementation NSData (SwitchData)

/**
 NSData 转  十六进制string
 
 @return NSString类型的十六进制string
 */
- (NSString *)convertDataToHexStr{
    if (!self || [self length] == 0) {
        return @"";
    }
    NSMutableString *string = [[NSMutableString alloc] initWithCapacity:[self length]];
    
    [self enumerateByteRangesUsingBlock:^(const void *bytes, NSRange byteRange, BOOL *stop) {
        unsigned char *dataBytes = (unsigned char*)bytes;
        for (NSInteger i = 0; i < byteRange.length; i++) {
            NSString *hexStr = [NSString stringWithFormat:@"%x", (dataBytes[i]) & 0xff];
            if ([hexStr length] == 2) {
                [string appendString:hexStr];
            } else {
                [string appendFormat:@"0%@", hexStr];
            }
        }
    }];
    
    return string;
}

/**
 NSData 转 NSString
 
 @return NSString类型的字符串
 */
- (NSString *)dataToString {
    Byte *bytes = (Byte *)[self bytes];
    NSMutableString *string = [[NSMutableString alloc] init];
    for(int i = 0; i< [self length]; i++) {
        if (i == 0) {
            [string appendString:[NSString stringWithFormat:@"%hhu",bytes[i]]];
        }else {
            [string appendString:[NSString stringWithFormat:@",%hhu",bytes[i]]];
        }
    }
    return string;
}
@end
