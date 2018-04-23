//
//  CustomKeyBoardView.h
//  sjpay
//
//  Created by sjzf on 18/04/2018.
//  Copyright © 2018 sjzf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomKeyboardDelegate.h"

typedef NS_ENUM(NSInteger, KeyBoardViewType) {
    KeyBoardView_Default,
    KeyBoardView_Num,
    KeyBoardView_ABC,
    KeyBoardView_Symbol
};



@interface CustomKeyBoardView : UIView

@property(nonatomic,assign)  KeyBoardViewType  activeViewType;

-(instancetype)initWithFrame:(CGRect)frame  andDelegate:(id<CustomKeyboardDelegate>)target;

-(void)actionTypeSwitch:(KeyBoardViewType)type;

@end
