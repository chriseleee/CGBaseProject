//
//  NSString+SwitchData.h
//  CGBaseProject
//
//  Created by chrise on 2018/3/15.
//  Copyright © 2018年 chrise. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SwitchData)
/**
 带子节的string转为NSData
 
 @return NSData类型
 */
-(NSData*) convertBytesStringToData ;


/**
 十进制转十六进制
 
 @return 十六进制字符串
 */
- (NSString *)decimalToHex;

/**
 十进制转十六进制
 length   总长度，不足补0
 @return 十六进制字符串
 */
- (NSString *)decimalToHexWithLength:(NSUInteger)length;

/**
 十六进制转十进制
 
 @return 十进制字符串
 */
- (NSString *)hexToDecimal;
/*
 二进制转十进制
 
 @return 十进制字符串
 */
- (NSString *)binaryToDecimal;

/**
 十进制转二进制
 
 @return 二进制字符串
 */
- (NSString *)decimalToBinary;
/**
 时间戳转标准时间
 
 @return 标准时间 YYYY-MM-dd HH:mm:ss
 */
- (NSString *)timestampToStandardtime;

/**
 时间戳转标准时间
 
 @return 标准时间数组 @[YYYY-MM-dd, HH:mm:ss]
 */
- (NSArray *)timestampToStandardtimes;
@end
