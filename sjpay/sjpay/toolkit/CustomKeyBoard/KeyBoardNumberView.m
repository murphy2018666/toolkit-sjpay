//
//  KeyBoard_Number.m
//  sjpay
//
//  Created by sjzf on 18/04/2018.
//  Copyright © 2018 sjzf. All rights reserved.
//

#import "KeyBoardNumberView.h"
#import "CustomKeyboardCell.h"
#import "NSArray+Mas.h"

#define KeyBoardNumberCount   12  //10个数字加上删除和后退按钮

@interface KeyBoardNumberView()

@property (nonatomic, assign) id<CustomKeyboardDelegate> delegate;

@property (nonatomic, assign)  BOOL  securityopt;

@end

@implementation KeyBoardNumberView


-(instancetype) initWithDeletegate:(id<CustomKeyboardDelegate> ) delegate  AndSecurityOption:(BOOL)opt
{
    
    self = [super init];
    
    if (self) {
        
        NSMutableArray *arrM = nil;
        
        self.delegate = delegate;
        
        self.securityopt = opt;
        
        if (self.securityopt) {
            
            arrM = [self randomKeyboard];
            
        }
        else
        {
            arrM = [NSMutableArray array];
            for (int i = 0 ; i < 10; i++) {
                [arrM addObject: [[NSNumber alloc] initWithInt:i]];
            }
        }
        
        int numIndex = 0;
        
        for (NSUInteger i = 0; i < KeyBoardNumberCount; i++) {
            
            CustomKeyboardCell * btn  =  [[CustomKeyboardCell alloc]init];
            
            if(i == 8)
            {
                btn.ActionProperty = AccessoryAction_Delete;
                [btn setBackgroundImage:[UIImage imageNamed:@"c_number_keyboardDeleteButton"] forState:UIControlStateNormal];
                [btn setBackgroundImage:[UIImage imageNamed:@"c_number_keyboardDeleteButtonSel"] forState:UIControlStateHighlighted];
                [btn setTitle:nil forState:UIControlStateNormal];
                btn.contentMode = UIViewContentModeCenter;
                
            }
            else if( i == 11)
            {
                btn.ActionProperty = AccessoryAction_Finish;
                 [btn setTitle:@"完成" forState:UIControlStateNormal];
                [btn setBackgroundImage:[UIImage imageNamed:@"login_c_number_keyboardLoginButton"] forState:UIControlStateNormal];
                [btn setBackgroundImage:[UIImage imageNamed:@"login_c_symbol_keyboardLoginButtonSel"] forState:UIControlStateHighlighted];
            }
            else
            {
                [btn setBackgroundImage:[UIImage imageNamed:@"c_numKeyboardButton"] forState:UIControlStateNormal];
                [btn setBackgroundImage:[UIImage imageNamed:@"c_numKeyboardButtonSel"] forState:UIControlStateHighlighted];
                btn.ActionProperty = AccessoryAction_Default;
                NSNumber *number = arrM[numIndex];
                NSString *title = number.stringValue;
                [btn setTitle:title forState:UIControlStateNormal];
                numIndex++;
            }
            
            [btn addTarget:self action:@selector(didKeyBoardTap:) forControlEvents:UIControlEventTouchUpInside];

            
            [self addSubview:btn];
        }
        
    }
    return self;
}

- (void)didKeyBoardTap :(CustomKeyboardCell *)button {
    if ([self.delegate respondsToSelector:@selector(keyboard:didClickButton:)]) {
        [self.delegate keyboard:self didClickButton:button];
    }
}

- (NSMutableArray *) randomKeyboard
{
    NSMutableArray *arrM = [NSMutableArray array];
    
    [arrM removeAllObjects];
    
    for (int i = 0 ; i < 10; i++) {
        int j = arc4random_uniform(10);
        
        NSNumber *number = [[NSNumber alloc] initWithInt:j];
        if ([arrM containsObject:number]) {
            i--;
            continue;
        }
        [arrM addObject:number];
    }
    
    return arrM;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    int cols = 3;//总列数
    
    [self.subviews mas_distributeSudokuViewsWithFixedItemWidth:0 fixedItemHeight:0 fixedLineSpacing:5 fixedInteritemSpacing:5 warpCount:cols topSpacing:10 bottomSpacing:10 leadSpacing:0 tailSpacing:0];
}


-(void)setdelegate:(id<CustomKeyboardDelegate> )delegate
{
    self.delegate = delegate;
}

@end
