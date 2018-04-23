//
//  KeyboardAccessoryView.m
//  sjpay
//
//  Created by sjzf on 19/04/2018.
//  Copyright © 2018 sjzf. All rights reserved.
//

#import "KeyboardAccessoryView.h"
#import "NSArray+Mas.h"
#import "CustomKeyboardCell.h"

@interface KeyboardAccessoryView()



/** 符号按钮 */
@property (nonatomic, strong) CustomKeyboardCell * symbolBtn;

/** ABC 文字按钮 */
@property (nonatomic, strong) CustomKeyboardCell *textBtn;

/**123 数字按钮 */
@property (nonatomic, strong) CustomKeyboardCell * numBtn;

@property (nonatomic, assign) id<KeyboardAccessorDelegate> delegate;

@end

@implementation KeyboardAccessoryView

-(instancetype)initWithFrame:(CGRect)frame  andTarget:(id<KeyboardAccessorDelegate>) delegate
{
    self =  [super initWithFrame:frame];
    
    if (self) {
        self.symbolBtn = [self setupBottomButtonWithTitle:@"符" image:[UIImage imageNamed:@"c_symbol_keyboardSwitchButtonSel"]];
        self.textBtn =  [self setupBottomButtonWithTitle:@"ABC" image:[UIImage imageNamed:@"c_symbol_keyboardSwitchButtonSel"]];
        self.numBtn =  [self setupBottomButtonWithTitle:@"数字" image:[UIImage imageNamed:@"c_symbol_keyboardSwitchButtonSel"]];
        self.backgroundColor = [UIColor  lightGrayColor];
        self.delegate = delegate;
    }
    
    return  self;
}

- (void)accessoryBtnDidClick :(UIButton *)accessoryBtn {
    if ([self.delegate respondsToSelector:@selector(keyboard:didClickAccessoryBtn:)]) {
        [self.delegate keyboard:self didClickAccessoryBtn:accessoryBtn];
    }
}

- (CustomKeyboardCell *)setupBottomButtonWithTitle:(NSString *)title image:(UIImage *)image {
    
    CustomKeyboardCell *headtitlebtn =  [[CustomKeyboardCell alloc] init];
    
    if (title) {
        [headtitlebtn setTitle:title forState:UIControlStateNormal];
        headtitlebtn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        [headtitlebtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    
    
    [headtitlebtn addTarget:self action:@selector(accessoryBtnDidClick:) forControlEvents:UIControlEventTouchUpInside];

    if (image) {
        [headtitlebtn setBackgroundImage:image forState:UIControlStateNormal];
    }
    
    [self addSubview:headtitlebtn];
    
    return headtitlebtn;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    int cols = 3;//总列数
    
    [self.subviews mas_distributeSudokuViewsWithFixedItemWidth:0 fixedItemHeight:0 fixedLineSpacing:5 fixedInteritemSpacing:5 warpCount:cols topSpacing:5 bottomSpacing:5 leadSpacing:self.frame.size.width/2 tailSpacing:0];
}


@end
