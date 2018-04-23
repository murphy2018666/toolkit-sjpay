//
//  KeyboardBtn.m
//  sjpay
//
//  Created by sjzf on 18/04/2018.
//  Copyright © 2018 sjzf. All rights reserved.
//

#import "CustomKeyboardCell.h"



@implementation CustomKeyboardCell


- (instancetype)init
{
    self = [super init];
    
    if (self) {
        //self.backgroundColor = [UIColor whiteColor];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        //self.adjustsImageWhenHighlighted = NO;

        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //UIImage *image = [UIImage imageNamed:@"hidden"];
        //[self setImage:image forState:UIControlStateNormal];
        
        //[self addTarget:self action:@selector(accessoryBtnDidClick) forControlEvents:UIControlEventTouchUpInside];
        
        self.ActionProperty =  AccessoryAction_Default;
        
        self.titleLabel.textAlignment = NSTextAlignmentCenter;

    }
    
    return self;
}

/*- (void)accessoryBtnDidClick {
    
    [self.nextResponder resignFirstResponder];
}*/

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    return CGRectMake(0, 0, contentRect.size.width, contentRect.size.height);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(2, 2, contentRect.size.width-2, contentRect.size.height-2);
}

- (UIButton *)setupBottomButtonWithTitle:(NSString *)title image:(UIImage *)image highImage:(UIImage *)highImage {
    
    if (title) {
        [self setTitle:title forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    
    if (image) {
        [self setBackgroundImage:image forState:UIControlStateNormal];
    }
    
    if (highImage) {
        [self setBackgroundImage:highImage forState:UIControlStateHighlighted];
    }
    
    return self;
}
@end
