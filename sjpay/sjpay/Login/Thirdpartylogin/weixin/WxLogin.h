//
//  WxLogin.h
//  sjpay
//
//  Created by sjzf on 13/04/2018.
//  Copyright © 2018 sjzf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import  "Ithirdpartylogin.h"
#import "WXApi.h"

@interface WxLogin : NSObject<Ithirdpartylogin,WXApiDelegate>

- (void)login;

- (void)prepare;



@end
