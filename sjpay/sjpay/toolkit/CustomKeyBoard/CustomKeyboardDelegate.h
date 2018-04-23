//
//  CustomKeyboardDelegate.h
//  sjpay
//
//  Created by sjzf on 19/04/2018.
//  Copyright © 2018 sjzf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomKeyboardCell.h"


@protocol CustomKeyboardDelegate <NSObject>

@optional
/** 点击了数字按钮 /字母按钮／符号按钮 */
- (void)keyboard:(UIView *)keyboard didClickButton:(CustomKeyboardCell *)button;

/** 点击删除按钮 */
- (void)keyboard:(UIView *)keyboard didClickDeleteBtn:(CustomKeyboardCell *)deleteBtn;

@end
