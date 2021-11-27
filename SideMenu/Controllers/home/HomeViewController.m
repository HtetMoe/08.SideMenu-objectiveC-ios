//
//  HomeViewController.m
//  SideMenu
//
//  Created by Htet Moe Phyu on 26/11/2021.

#import "HomeViewController.h"

@interface HomeViewController ()
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.sideMenuBtn = [[UIButton alloc]init];
    [self.sideMenuBtn setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    [self.sideMenuBtn addTarget:self action:@selector(sideMenuBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.sideMenuBtn];
}

-(void)sideMenuBtnPressed : (UIButton *)button{
    [self.delegate menuBtnPressed];
}

@end
