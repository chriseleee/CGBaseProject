//
//  NSData+SwitchData.h
//  CGBaseProject
//
//  Created by chrise on 2018/3/15.
//  Copyright © 2018年 chrise. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (SwitchData)
/**
 NSData 转  十六进制string
 
 @return NSString类型的十六进制string
 */
- (NSString *)convertDataToHexStr;




/**
 NSData 转 NSString
 
 @return NSString类型的字符串
 */
- (NSString *)dataToString;
@end
