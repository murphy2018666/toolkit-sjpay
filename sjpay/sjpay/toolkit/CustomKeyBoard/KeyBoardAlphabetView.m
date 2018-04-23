//
//  KeyBoardAlphabetView.m
//  sjpay
//
//  Created by sjzf on 20/04/2018.
//  Copyright © 2018 sjzf. All rights reserved.
//

#import "KeyBoardAlphabetView.h"
#import "NSArray+Mas.h"


@interface KeyBoardAlphabetView()

@property (nonatomic,strong) NSArray * alphabetArray;

@property (nonatomic, assign) id<CustomKeyboardDelegate> delegate;

@property (nonatomic,strong) CustomKeyboardCell * clearBtn;

@property (nonatomic,strong) CustomKeyboardCell * upcaseSwitchBtn;

@property (nonatomic,strong) CustomKeyboardCell *blankSpaceBtn;

@property (nonatomic,strong) CustomKeyboardCell *FinishBtn;



@property (nonatomic,strong) NSMutableArray * rawsArrays;


@end

@implementation KeyBoardAlphabetView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(instancetype) initWithDeletegate:(id<CustomKeyboardDelegate> ) delegate
{
    self = [super init];
    
    if (self) {

        NSMutableArray  *  raw_one =  [[NSMutableArray alloc]init];
        NSMutableArray  *  raw_two =  [[NSMutableArray alloc]init];
        NSMutableArray  *  raw_three =  [[NSMutableArray alloc]init];
        
        for (int i =  0; i < self.alphabetArray.count; i++) {
            
            CustomKeyboardCell * btn  =  [[CustomKeyboardCell alloc]init];
            [btn setBackgroundImage:[UIImage imageNamed:@"c_chaKeyboardButton"] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"c_chaKeyboardButtonSel"] forState:UIControlStateHighlighted];
            btn.ActionProperty = AccessoryAction_Default;
            [btn setTitle:_alphabetArray[i] forState:UIControlStateNormal];
        
            [btn addTarget:self action:@selector(didKeyBoardTap:) forControlEvents:UIControlEventTouchUpInside];

            
            //raw1
            if ( i< 10) {
                [raw_one addObject:btn];
                [self addSubview:btn];
            }
            else if( i >= 10 && i <= 18 )//raw2
            {
                [raw_two addObject:btn];
                [self addSubview:btn];
            }
            else //raw 3
            {
                if (i == 19) {
                    [raw_three  addObject:self.upcaseSwitchBtn];
                    [self addSubview:self.upcaseSwitchBtn];

                    [raw_three  addObject:btn];
                    [self addSubview:btn];

                }
                else if(i == 25)
                {
                    [raw_three  addObject:btn];
                    [self addSubview:btn];
                    //[raw_three  addObject:self.clearBtn];
                    [self addSubview:self.clearBtn];
                }
                else{
                    [raw_three  addObject:btn];
                    [self addSubview:btn];
                }
            }
        }
        
        [self.rawsArrays addObject:raw_one];
        [self.rawsArrays addObject:raw_two];
        [self.rawsArrays addObject:raw_three];
    }
    
    return self;
}

-(NSMutableArray*)rawsArrays
{
    if (!_rawsArrays) {
        _rawsArrays = [[NSMutableArray alloc]init];
    }
    return  _rawsArrays;
}

- (NSArray *)alphabetArray {
    
    if (!_alphabetArray) {
        
        _alphabetArray = [NSArray arrayWithObjects:@"Q",@"W",@"E",@"R",@"T",@"Y",@"U",@"I",@"O",@"P",@"A",@"S",@"D",@"F",@"G",@"H",@"J",@"K",@"L",@"Z",@"X",@"C",@"V",@"B",@"N",@"M", nil];
    }
    
    return _alphabetArray;
}


- (UIButton *)clearBtn {
    
    if (!_clearBtn)
    {
        _clearBtn = [CustomKeyboardCell new];
        [_clearBtn setImage:[UIImage imageNamed:@"c_symbol_keyboardDeleteButton"] forState:UIControlStateNormal];
        [_clearBtn setImage:[UIImage imageNamed:@"c_symbol_keyboardDeleteButtonSel"] forState:UIControlStateHighlighted];
        [_clearBtn addTarget:self action:@selector(didKeyBoardTap:) forControlEvents:UIControlEventTouchUpInside];
        _clearBtn.imageView.contentMode = UIViewContentModeScaleAspectFill;
        
        [self addSubview:_clearBtn];
    }
    
    return _clearBtn;
    
}


- (CustomKeyboardCell *)upcaseSwitchBtn {
    
    if (!_upcaseSwitchBtn)
    {
        _upcaseSwitchBtn = [CustomKeyboardCell new];
        [_upcaseSwitchBtn setImage:[UIImage imageNamed:@"c_charKeyboardShiftButton"] forState:UIControlStateNormal];
        [_upcaseSwitchBtn setImage:[UIImage imageNamed:@"c_charKeyboardShiftButtonSel"] forState:UIControlStateHighlighted];
        [_upcaseSwitchBtn addTarget:self action:@selector(didKeyBoardTap:) forControlEvents:UIControlEventTouchUpInside];
        _upcaseSwitchBtn.imageView.contentMode = UIViewContentModeScaleAspectFill;
        _upcaseSwitchBtn.ActionProperty = AccessoryAction_UPCASE;
    }
    
    return _upcaseSwitchBtn;
}


-(CustomKeyboardCell*) blankSpaceBtn
{
    if (!_blankSpaceBtn) {
        _blankSpaceBtn = [CustomKeyboardCell new];
        [_blankSpaceBtn setImage:[UIImage imageNamed:@"c_character_keyboardSwitchButton"] forState:UIControlStateNormal];
        [_blankSpaceBtn setImage:[UIImage imageNamed:@"c_character_keyboardSwitchButtonSel"] forState:UIControlStateHighlighted];
        [_blankSpaceBtn addTarget:self action:@selector(didKeyBoardTap:) forControlEvents:UIControlEventTouchUpInside];
        _blankSpaceBtn.imageView.contentMode = UIViewContentModeScaleAspectFill;
        [_blankSpaceBtn setTitle:@"安全键盘" forState:UIControlStateNormal];
        
        [self addSubview:_blankSpaceBtn];
    }
    
    return _blankSpaceBtn;
}


-(UIButton*)FinishBtn
{
    if (!_FinishBtn) {
        _FinishBtn = [CustomKeyboardCell new];
        [_FinishBtn setImage:[UIImage imageNamed:@"login_c_number_keyboardLoginButton"] forState:UIControlStateNormal];
        [_FinishBtn setImage:[UIImage imageNamed:@"login_c_number_keyboardLoginButtonSel"] forState:UIControlStateHighlighted];
        [_FinishBtn addTarget:self action:@selector(didKeyBoardTap:) forControlEvents:UIControlEventTouchUpInside];
        _FinishBtn.imageView.contentMode = UIViewContentModeScaleAspectFill;
        [_FinishBtn setTitle:@"完成" forState:UIControlStateNormal];
        _FinishBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        
        
        [self addSubview:_FinishBtn];
    }
    
    
    return _FinishBtn;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    int cols = 10;//总列数
    int raws = 4;
    
    CGFloat  rawHeight = self.frame.size.height/4;
    
    
    [self.rawsArrays[0] mas_distributeSudokuViewsWithFixedItemWidth:0 fixedItemHeight:0 fixedLineSpacing:5 fixedInteritemSpacing:5 warpCount:cols topSpacing:10 bottomSpacing:rawHeight*3 leadSpacing:0 tailSpacing:0];
    
    [self.rawsArrays[1] mas_distributeSudokuViewsWithFixedItemWidth:0 fixedItemHeight:0 fixedLineSpacing:5 fixedInteritemSpacing:5 warpCount:9 topSpacing:(10+rawHeight) bottomSpacing:rawHeight*2 leadSpacing:15 tailSpacing:15];
    
    [self.rawsArrays[2] mas_distributeSudokuViewsWithFixedItemWidth:0 fixedItemHeight:0 fixedLineSpacing:5 fixedInteritemSpacing:5 warpCount:cols topSpacing:(10+rawHeight*2) bottomSpacing:rawHeight leadSpacing: 0 tailSpacing:0];
    
    
    CustomKeyboardCell * cell = [self.rawsArrays[2] lastObject];
    [self.clearBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(cell.mas_right).offset(5);
        make.right.equalTo(self);
        make.top.equalTo(cell).offset(5);
    }];
    
    
   [self.blankSpaceBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(@(0));
        make.top.equalTo(self.clearBtn.mas_bottom).offset(5);
        make.width.equalTo(self.mas_width).multipliedBy(3/5.f);
        make.height.equalTo(self.clearBtn);
        
    }];
    
    [self.FinishBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.blankSpaceBtn.mas_right).offset(5);
        make.top.equalTo(self.clearBtn.mas_bottom).offset(5);
        make.width.equalTo(self.mas_width).multipliedBy(2/5.f);
        make.height.equalTo(self.clearBtn);
        
    }];

}


- (void)didKeyBoardTap :(CustomKeyboardCell *)button {
    if (button.ActionProperty == AccessoryAction_UPCASE) {
        //upcase and lowercase switch
        NSMutableArray * btnarrays = [[NSMutableArray alloc]init];
        [btnarrays addObjectsFromArray:self.rawsArrays[0]];
        [btnarrays addObjectsFromArray:self.rawsArrays[1]];
        [btnarrays addObjectsFromArray:self.rawsArrays[2]];
        
        for (CustomKeyboardCell * cell in btnarrays) {
            
            NSRegularExpression *tLetterRegularExpression = [NSRegularExpression regularExpressionWithPattern:@"[A-Z]"options:nil error:nil];
            
            if (cell.titleLabel.text ) {
                
                NSString  * comparisiontext = cell.titleLabel.text;
                
                NSUInteger tLetterMatchCount = [tLetterRegularExpression numberOfMatchesInString:comparisiontext options:NSMatchingReportProgress range:NSMakeRange(0, comparisiontext.length)];
                
                if (tLetterMatchCount > 0) {
                    
                    [cell setTitle:[comparisiontext lowercaseString] forState:UIControlStateNormal];
                }
                else{
                    [cell setTitle:[comparisiontext uppercaseString]  forState:UIControlStateNormal];
                }
                
            }
        }

    }
    else if ([self.delegate respondsToSelector:@selector(keyboard:didClickButton:)]) {
        [self.delegate keyboard:self didClickButton:button];
    }
}

@end
