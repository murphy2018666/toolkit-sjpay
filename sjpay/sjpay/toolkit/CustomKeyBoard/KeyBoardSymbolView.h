//
//  KeyBoardSymbolView.h
//  sjpay
//
//  Created by sjzf on 23/04/2018.
//  Copyright © 2018 sjzf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomKeyboardDelegate.h"

@interface KeyBoardSymbolView : UIView

-(instancetype) initWithDeletegate:(id<CustomKeyboardDelegate> ) delegate;

@end
