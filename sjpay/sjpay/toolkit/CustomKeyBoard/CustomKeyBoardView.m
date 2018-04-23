//
//  CustomKeyBoardView.m
//  sjpay
//
//  Created by sjzf on 18/04/2018.
//  Copyright © 2018 sjzf. All rights reserved.
//

#import "CustomKeyBoardView.h"
#import "CustomKeyboardCell.h"
#import "KeyBoardNumberView.h"
#import "KeyBoardAlphabetView.h"
#import "KeyBoardSymbolView.h"

#import "CustomKeyboardDelegate.h"



#define CustomKeyboardCols 3

#define CustomKeyboardTextFont 20


@interface CustomKeyBoardView ()

@property (nonatomic, assign) id<CustomKeyboardDelegate> delegate;

@property (nonatomic, strong) UIView * keyboardview_num;
@property (nonatomic, strong) UIView * keyboardview_abc;
@property (nonatomic, strong) UIView * keyboardview_symbol;

@end

@implementation CustomKeyBoardView



-(instancetype)initWithFrame:(CGRect)frame  andDelegate:(id<CustomKeyboardDelegate>)target{
    
    self  = [super initWithFrame:frame];
    
    if(self){
            self.keyboardview_num =  [[KeyBoardNumberView alloc]initWithDeletegate:target AndSecurityOption:YES];
            self.keyboardview_abc =  [[KeyBoardAlphabetView alloc]initWithDeletegate:target];
            self.keyboardview_symbol =  [[KeyBoardSymbolView alloc]initWithDeletegate:target];
        
        self.delegate = target;

        [self addSubview:self.keyboardview_num];
        //[self addSubview:self.keyboardview_abc];
        //[self addSubview:self.keyboardview_symbol];
    }
    
    return self;
    
}


- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    __weak __typeof(self) weakSelf = self;

    if (self.activeViewType == KeyBoardView_Default || self.activeViewType == KeyBoardView_Num) {
        [self.keyboardview_num  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf).offset(5);
            make.right.equalTo(weakSelf).offset(-5);
            make.top.equalTo(weakSelf);
            make.height.equalTo(weakSelf);
        }];
    }
    else if(self.activeViewType == KeyBoardView_Symbol)
    {
        [self.keyboardview_symbol  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf).offset(5);
            make.right.equalTo(weakSelf).offset(-5);
            make.top.equalTo(weakSelf);
            make.height.equalTo(weakSelf);
        }];
    }
    else if(self.activeViewType  == KeyBoardView_ABC)
    {
        [self.keyboardview_abc  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf).offset(5);
            make.right.equalTo(weakSelf).offset(-5);
            make.top.equalTo(weakSelf);
            make.height.equalTo(weakSelf);
        }];
    }
    
}

-(void)actionTypeSwitch:(KeyBoardViewType)type
{
    self.activeViewType = type;
    
    if (self.activeViewType == KeyBoardView_Default || self.activeViewType == KeyBoardView_Num) {

        [self.keyboardview_symbol removeFromSuperview];
        [self.keyboardview_abc  removeFromSuperview];
        [self addSubview:self.keyboardview_num];
        
    }
    else if(self.activeViewType == KeyBoardView_Symbol)
    {
        [self.keyboardview_num  removeFromSuperview];
        [self.keyboardview_abc  removeFromSuperview];
        
        [self addSubview:self.keyboardview_symbol];
    }
    else if(self.activeViewType  == KeyBoardView_ABC)
    {
        [self.keyboardview_symbol  removeFromSuperview];
        [self.keyboardview_num  removeFromSuperview];
        
        [self addSubview:self.keyboardview_abc];
    }

}


@end
