//
//  MyUncaughtExceptionHandler.h
//  sjpay
//
//  Created by sjzf on 13/04/2018.
//  Copyright © 2018 sjzf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyUncaughtExceptionHandler : NSObject
+ (void)setDefaultHandler;
+ (NSUncaughtExceptionHandler *)getHandler;
+ (void)TakeException:(NSException *) exception;

@end
