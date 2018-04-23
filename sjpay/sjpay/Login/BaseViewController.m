//
//  BaseViewController.m
//  sjpay
//
//  Created by sjzf on 12/04/2018.
//  Copyright © 2018 sjzf. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithTitle:@"" style:0 target:self action:@selector(back:)];
    [back setTitle:@""];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    self.navigationItem.backBarButtonItem = back;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) back:(UIBarButtonItem *) sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
