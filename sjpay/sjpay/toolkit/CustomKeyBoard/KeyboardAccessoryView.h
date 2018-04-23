//
//  KeyboardAccessoryView.h
//  sjpay
//
//  Created by sjzf on 19/04/2018.
//  Copyright © 2018 sjzf. All rights reserved.
//

#import <Foundation/Foundation.h>


@class KeyboardAccessoryView;

@protocol KeyboardAccessorDelegate <NSObject>

@optional
/** 点击了数字按钮 /字母按钮／符号按钮 */
- (void)keyboard:(KeyboardAccessoryView *)keyboard didClickAccessoryBtn:(UIButton *)button;

@end

@interface KeyboardAccessoryView : UIView

-(instancetype)initWithFrame:(CGRect)frame  andTarget:(id<KeyboardAccessorDelegate>) delegate;

@end
