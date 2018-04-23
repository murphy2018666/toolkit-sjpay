//
//  WxLogin.m
//  sjpay
//
//  Created by sjzf on 13/04/2018.
//  Copyright © 2018 sjzf. All rights reserved.
//

#import "WxLogin.h"


@implementation WxLogin

- (void)prepare {
    
    
   [WXApi registerApp:@"wxd477edab60670232"];
}

- (void)login {

    SendAuthReq* req = [[SendAuthReq alloc] init];
    req.scope = @"snsapi_message,snsapi_userinfo,snsapi_friend,snsapi_contact"; // @"post_timeline,sns"
    req.state = @"xxx";
    
    [WXApi sendAuthReq:req viewController:self delegate:nil];
    
}

-(void) onReq:(BaseReq*)reqonReq
{
    
}

-(void) onResp:(BaseResp*)res
{
    
}

@end
