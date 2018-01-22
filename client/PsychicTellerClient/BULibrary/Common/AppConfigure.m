//
//  AppConfigure.m
//  pbuWorldMysteryLite
//
//  Created by Yan Xue on 12-2-13.
//  Copyright (c) 2012年 ShootingChance. All rights reserved.
//

#import "AppConfigure.h"
#import "UIDevice+Resolutions.h"

@implementation AppConfigure

+(BOOL)IsProductionServer
{
    return YES;
}

+ (NSString*)GetWebServiceDomain
{
    if ([AppConfigure IsProductionServer])
        return @"http://api.crperfect.com";    //正式服务器
    else
        return @"http://test.api.crperfect.com";    //测试服务器
}

+ (NSString*)GetHtmlDomain
{
    if ([AppConfigure IsProductionServer])
        return @"http://api.crperfect.com";     //正式服务器
    else
        return @"http://test.api.crperfect.com";    //测试服务器
}

+ (NSString*)GetPayDomain
{
    if ([AppConfigure IsProductionServer])
        return @"http://pay.crperfect.com";     //正式服务器
    else
        return @"http://test.pay.crperfect.com";    //测试服务器
}

+ (NSString*)GetShareDomain
{
    if ([AppConfigure IsProductionServer])
        return @"http://share.crperfect.com";     //正式服务器
    else
        return @"http://test.share.crperfect.com";    //测试服务器
}

+ (NSString*)GetFileDomain
{
    if ([AppConfigure IsProductionServer])
        return @"http://ztzp.oss-cn-beijing.aliyuncs.com";     //正式服务器
    else
        return @"http://ztzp.oss-cn-beijing.aliyuncs.com";    //测试服务器
}

#pragma mark - screen adaption
+(CGFloat) GetLengthAdaptRate;
{
    CGFloat rate = 1;
    if([[UIDevice currentDevice] resolution]==UIDeviceResolution_iPhoneRetina4 ||
       [[UIDevice currentDevice] resolution]==UIDeviceResolution_iPhoneRetina35)
    {
        rate = 320/375.0;
    }
    if([[UIDevice currentDevice] resolution]==UIDeviceResolution_iPhoneRetina47)
    {
        rate = 1;
    }
    else if([[UIDevice currentDevice] resolution]==UIDeviceResolution_iPhoneRetina55)
    {
        rate = 414/375.0;
    }
    else if([[UIDevice currentDevice] resolution]==UIDeviceResolution_iPadRetina )
    {
        return 768.0/320.0;
    }
    else if([[UIDevice currentDevice] resolution]==UIDeviceResolution_iPadStandard)
    {
        return 768.0/320.0;
    }
    return rate;
}


@end
