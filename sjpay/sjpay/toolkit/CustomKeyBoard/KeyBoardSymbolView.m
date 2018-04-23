//
//  KeyBoardSymbolView.m
//  sjpay
//
//  Created by sjzf on 23/04/2018.
//  Copyright © 2018 sjzf. All rights reserved.
//

#import "KeyBoardSymbolView.h"
#import "NSArray+Mas.h"

@interface  KeyBoardSymbolView()

@property (nonatomic,strong) NSArray * symbolArray;

@property (nonatomic, assign) id<CustomKeyboardDelegate> delegate;

@property (nonatomic,strong) CustomKeyboardCell * clearBtn;

@property (nonatomic,strong) NSMutableArray * rawsArrays;

@property (nonatomic,strong) CustomKeyboardCell *FinishBtn;
@end

@implementation KeyBoardSymbolView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype) initWithDeletegate:(id<CustomKeyboardDelegate> ) delegate
{
    self  = [super init];
    
    if (self) {
        NSMutableArray  *  raw_one =  [[NSMutableArray alloc]init];
        NSMutableArray  *  raw_two =  [[NSMutableArray alloc]init];
        NSMutableArray  *  raw_three =  [[NSMutableArray alloc]init];
        NSMutableArray  *  raw_four =  [[NSMutableArray alloc]init];
        
        for (int i =  0; i < self.symbolArray.count; i++) {
            
            CustomKeyboardCell * btn  =  [[CustomKeyboardCell alloc]init];
            [btn setBackgroundImage:[UIImage imageNamed:@"c_chaKeyboardButton"] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"c_chaKeyboardButtonSel"] forState:UIControlStateHighlighted];
            btn.ActionProperty = AccessoryAction_Default;
            [btn setTitle:_symbolArray[i] forState:UIControlStateNormal];
            
            [btn addTarget:self action:@selector(didKeyBoardTap:) forControlEvents:UIControlEventTouchUpInside];
            
            //raw1
            if ( i< 10) {
                [raw_one addObject:btn];
                [self addSubview:btn];
            }
            else if( i >= 10 && i <= 19 )//raw2
            {
                [raw_two addObject:btn];
                [self addSubview:btn];
            }
            else if( i >= 20 && i < 28) //raw3
            {
                if (i == 27) {
                    
                    [raw_three  addObject:btn];
                    [self addSubview:btn];
                }
                else{
                    [raw_three  addObject:btn];
                    [self addSubview:btn];
                }
            }
            else
            {
                if(i == 35) //raw4
                {
                    [raw_four  addObject:btn];
                    [self addSubview:btn];
                }
                else{
                    [raw_four  addObject:btn];
                    [self addSubview:btn];
                }
            }
        }
        
        [self.rawsArrays addObject:raw_one];
        [self.rawsArrays addObject:raw_two];
        [self.rawsArrays addObject:raw_three];
        
        [self.rawsArrays addObject:raw_four];
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

-(NSArray*)symbolArray
{
    if (!_symbolArray) {
        _symbolArray = [NSArray arrayWithObjects:@"[",@"]",@"{",@"}",@"#",@"%",@"^",@"*",@"+",@"=",@"_",@"-",@"/",@":",@";",@"(",@")",@"$",@"&",@"@",@".",@",",@"?",@"!",@"'",@"\\",@"|",@"~",@"`",@"<",@"€",@"£",@"¥",@"\"", nil];
    }
    
    return _symbolArray;
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
    
    CGFloat  rawHeight = self.frame.size.height/4;
    
    
    [self.rawsArrays[0] mas_distributeSudokuViewsWithFixedItemWidth:0 fixedItemHeight:0 fixedLineSpacing:5 fixedInteritemSpacing:5 warpCount:cols topSpacing:10 bottomSpacing:rawHeight*3 leadSpacing:0 tailSpacing:0];
    
    [self.rawsArrays[1] mas_distributeSudokuViewsWithFixedItemWidth:0 fixedItemHeight:0 fixedLineSpacing:5 fixedInteritemSpacing:5 warpCount:10 topSpacing:(10+rawHeight) bottomSpacing:rawHeight*2 leadSpacing:0 tailSpacing:0];
    

    
    [self.rawsArrays[2] mas_distributeSudokuViewsWithFixedItemWidth:0 fixedItemHeight:0 fixedLineSpacing:5 fixedInteritemSpacing:5 warpCount:10 topSpacing:(10+rawHeight*2) bottomSpacing:rawHeight leadSpacing: 0 tailSpacing:0];
    
    CustomKeyboardCell * cell = [self.rawsArrays[2] lastObject];
    [self.clearBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(cell.mas_right).offset(5);
        make.right.equalTo(self);
        make.top.equalTo(cell).offset(5);
    }];
    
    [self.rawsArrays[3] mas_distributeSudokuViewsWithFixedItemWidth:0 fixedItemHeight:0 fixedLineSpacing:5 fixedInteritemSpacing:5 warpCount:10 topSpacing:(10+rawHeight*3) bottomSpacing:5 leadSpacing: 0 tailSpacing:0];
    
    
    CustomKeyboardCell * lstcell = [self.rawsArrays[3] lastObject];
    
    [self.FinishBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(lstcell.mas_right).offset(5);
        make.top.equalTo(lstcell.mas_top);
        make.right.equalTo(self.mas_right);
        make.height.equalTo(lstcell.mas_height);
    }];

}


- (void)didKeyBoardTap :(CustomKeyboardCell *)button {
   if ([self.delegate respondsToSelector:@selector(keyboard:didClickButton:)]) {
        [self.delegate keyboard:self didClickButton:button];
    }
}

@end
