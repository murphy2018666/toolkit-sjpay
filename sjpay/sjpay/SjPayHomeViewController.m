//
//  ViewController.m
//  sjpay
//
//  Created by sjzf on 11/04/2018.
//  Copyright © 2018 sjzf. All rights reserved.
//

#import "SjPayHomeViewController.h"
#import "GesturePasswordController.h"
#import "CustomKeyBoardView.h"
#import "CustomKeyboardCell.h"
#import "KeyboardAccessoryView.h"
#import "CustomKeyboardDelegate.h"
#import "KeyBoardSymbolView.h"



@interface SjPayHomeViewController ()<UITextFieldDelegate,CustomKeyboardDelegate,KeyboardAccessorDelegate>

@property (strong, nonatomic)  UIButton *topleftImageButton;

@property (strong, nonatomic)  UIButton *toprightImageButton;

@property (strong, nonatomic)  UITextField *textField;

@property (strong, nonatomic)  CustomKeyBoardView *keyboard;
@end

@implementation SjPayHomeViewController

NSMutableArray *array;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"聚钱包";
    
    NSString * imagePath=@"HomeVC.bundle/ap_home_top_icon_scan_new@2x.png";
    
    NSString * highlightImagePath=@"HomeVC.bundle/ap_home_top_icon_scan_new_highlight@2x.png";
    
    self.topleftImageButton  = [[UIButton alloc]init];
    self.toprightImageButton = [[UIButton alloc]init];
    
    [self.topleftImageButton setImage:[UIImage imageNamed:imagePath]  forState:UIControlStateNormal];
    [self.topleftImageButton setImage:[UIImage imageNamed:highlightImagePath]  forState:UIControlStateHighlighted];
    
    imagePath=@"HomeVC.bundle/ap_home_top_icon_pay_new@2x.png";
    highlightImagePath=@"HomeVC.bundle/ap_home_top_icon_pay_new_highlight@2x.png";
    
    [self.toprightImageButton setImage:[UIImage imageNamed:imagePath]  forState:UIControlStateNormal];
    [self.toprightImageButton setImage:[UIImage imageNamed:highlightImagePath]  forState:UIControlStateHighlighted];
    
    [self.view addSubview:self.topleftImageButton];
    
    [self.view addSubview:self.toprightImageButton];
    
    self.textField = [[UITextField alloc]init];
    self.textField.backgroundColor = [UIColor blueColor];
    self.textField.inputAccessoryView = [[KeyboardAccessoryView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,50) andTarget:self];
    self.textField.inputView = self.keyboard;
    self.textField.delegate = self;
    [self.view addSubview: self.textField];
}

-(void)viewWillLayoutSubviews
{
    __weak  typeof(self)  weakself = self;
    
    [self.topleftImageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.view.mas_top).offset(60);
        make.width.equalTo(weakself.view).dividedBy(2);
        make.left.equalTo(weakself.view);
    }];
    
    [self.toprightImageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.view.mas_top).offset(60);
        make.width.equalTo(weakself.view).dividedBy(2);
        make.right.equalTo(weakself.view);
    }];
    
    [self.textField  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.toprightImageButton).offset(200);
        make.width.equalTo(weakself.view);
        make.height.equalTo(weakself.view).dividedBy(10);
    }];
    
    /*[self.keyboard  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.textField.mas_bottom).offset(20);
        make.width.equalTo(weakself.view);
        make.height.equalTo(weakself.view).dividedBy(2);
    }];*/

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/***************需要*************/
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    self.textField.text = nil;
    
    CGFloat x = 0;
    
    
    __weak  typeof(self)  weakself = self;
    
    //[self.view addSubview:_keyboard];
    
    self.keyboard= [[CustomKeyBoardView alloc]initWithFrame:CGRectMake(0,  self.view.frame.size.height - 216, self.view.frame.size.width, 216) andDelegate:self];
    self.textField.inputView = self.keyboard;


   /* [self.keyboard  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.textField.mas_bottom).offset(20);
        make.width.equalTo(weakself.view);
        make.height.equalTo(weakself.view).dividedBy(2);
    }];*/
    
    
    return YES;
}

/** 点击了数字按钮 /字母按钮／符号按钮 */
- (void)keyboard:(UIView *)keyboard didClickButton:(CustomKeyboardCell *)button
{
    CustomKeyboardCell * target = (CustomKeyboardCell*)button;
    
    if (target.ActionProperty == AccessoryAction_Default ) {
    }
    else if(target.ActionProperty == AccessoryAction_Delete){
    }
    else if(target.ActionProperty == AccessoryAction_Finish)
    {
        [self.textField resignFirstResponder];
    }
    else
    {
        NSLog(@"Donot  suppport this action");
    }
    
    
    NSString *identifier = [[[UIDevice currentDevice] identifierForVendor] UUIDString];

    UIDevice *device = [[UIDevice alloc] init];
    NSString *name = device.name;       //获取设备所有者的名称
    NSString *model = device.model;      //获取设备的类别
    NSString *type = device.localizedModel; //获取本地化版本
    NSString *systemName = device.systemName;   //获取当前运行的系统
    NSString *systemVersion = device.systemVersion;//获取当前系统的版本
}

/** 点击删除按钮 */
- (void)keyboard:(UIView *)keyboard didClickDeleteBtn:(CustomKeyboardCell *)deleteBtn
{
    
}

- (void)keyboard:(KeyboardAccessoryView *)keyboard didClickAccessoryBtn:(CustomKeyboardCell *)button
{
    NSString * context = button.titleLabel.text;
    
    if ([context isEqualToString:@"数字"]) {
        [self.keyboard actionTypeSwitch:KeyBoardView_Default];
    }
    else if([context isEqualToString:@"符"])
    {
        [self.keyboard actionTypeSwitch:KeyBoardView_Symbol];
    }
    else if([context isEqualToString:@"ABC"])
    {
        [self.keyboard actionTypeSwitch:KeyBoardView_ABC];
    }
    
    //[self.keyboard  layoutSubviews];
}

@end
