//
//  KeyboardBtn.h
//  sjpay
//
//  Created by sjzf on 18/04/2018.
//  Copyright © 2018 sjzf. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, KeyboardAccessoryActionType) {
    AccessoryAction_Default,
    AccessoryAction_Delete,
    AccessoryAction_UPCASE,
    AccessoryAction_Finish
};


@interface CustomKeyboardCell  : UIButton

@property(nonatomic,assign)  KeyboardAccessoryActionType  ActionProperty;


- (UIButton *)setupBottomButtonWithTitle:(NSString *)title image:(UIImage *)image highImage:(UIImage *)highImage;

@end
