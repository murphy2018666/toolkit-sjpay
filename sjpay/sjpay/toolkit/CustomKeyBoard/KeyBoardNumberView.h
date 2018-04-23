//
//  KeyBoard_Number.h
//  sjpay
//
//  Created by sjzf on 18/04/2018.
//  Copyright © 2018 sjzf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomKeyboardDelegate.h"


@interface KeyBoardNumberView : UIView

-(instancetype) initWithDeletegate:(id<CustomKeyboardDelegate> ) delegate  AndSecurityOption:(BOOL)opt;

@end
