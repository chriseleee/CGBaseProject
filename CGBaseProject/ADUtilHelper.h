//
//  ADUtilHelper.h
//  Adas
//
//  Created by dulingkang on 16/2/18.
//  Copyright © 2016年 Smartereye. All rights reserved.
//  获取文件的MD5值

#import <Foundation/Foundation.h>
#import <SystemConfiguration/CaptiveNetwork.h>
@interface ADUtilHelper : NSObject

+(NSString *)getFileMD5WithPath:(NSString*)path;
+(NSString *)getWifiName;
@end
