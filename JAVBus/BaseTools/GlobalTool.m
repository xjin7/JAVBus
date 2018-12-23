//
//  GlobalTool.m
//  JAVBus
//
//  Created by mgfjx on 2018/12/22.
//  Copyright © 2018 mgfjx. All rights reserved.
//

#import "GlobalTool.h"

@implementation GlobalTool

@synthesize columnNum = _columnNum;
@synthesize baseUrl = _baseUrl;
@synthesize ips = _ips;

SingletonImplement(Instance)

- (void)setColumnNum:(NSUInteger)columnNum {
    _columnNum = columnNum;
    [[NSUserDefaults standardUserDefaults] setInteger:columnNum forKey:@"kColumnNumber"];
}

- (NSUInteger)columnNum {
    NSInteger num = [[NSUserDefaults standardUserDefaults] integerForKey:@"kColumnNumber"];
    if (num < 1) {
        num = 3;
    }
    return num;
}

- (void)setBaseUrl:(NSString *)baseUrl {
    _baseUrl = baseUrl;
    [[NSUserDefaults standardUserDefaults] setObject:baseUrl forKey:@"kBaseUrl"];
}

- (NSString *)baseUrl {
    NSString *url = [[NSUserDefaults standardUserDefaults] objectForKey:@"kBaseUrl"];
    if (!url || url.length == 0) {
        url = @"https://www.javbus.pw";
    }
    return url;
}

- (void)setIps:(NSArray *)ips {
    _ips = ips;
    [[NSUserDefaults standardUserDefaults] setObject:ips forKey:@"kHTTPAdress"];
}

- (NSArray *)ips {
    NSArray *ips = [[NSUserDefaults standardUserDefaults] objectForKey:@"kHTTPAdress"];
    if (!ips || ips.count == 0) {
        ips = @[
                @"https://www.javbus.pw",
                @"https://www.javbus.com",
                @"https://www.busdmm.cc",
                @"https://www.dmmbus.co",
                @"https://www.seedmm.co",
                ];
    }
    return ips;
}

@end
