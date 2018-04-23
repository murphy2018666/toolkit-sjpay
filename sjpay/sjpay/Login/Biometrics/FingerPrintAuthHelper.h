//
//  FingerPrintAuth.h
//  sjpay
//
//  Created by sjzf on 16/04/2018.
//  Copyright © 2018 sjzf. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^AuthenticateResponseBlock)(BOOL,NSString*);

@interface FingerPrintAuthHelper : NSObject

-(BOOL) checkSupport;

-(BOOL) checkState;

-(void) Authenticate:(AuthenticateResponseBlock)response;

@end
