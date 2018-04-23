//
//  KeyBoardAlphabetView.h
//  sjpay
//
//  Created by sjzf on 20/04/2018.
//  Copyright © 2018 sjzf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomKeyboardDelegate.h"

@interface KeyBoardAlphabetView : UIView

-(instancetype) initWithDeletegate:(id<CustomKeyboardDelegate> ) delegate;

@end
