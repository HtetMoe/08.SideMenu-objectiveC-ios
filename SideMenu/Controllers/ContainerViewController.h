//
//  ViewController.h
//  SideMenu
//
//  Created by Htet Moe Phyu on 25/11/2021.
//

#import <UIKit/UIKit.h>
#import "MenuViewController.h"
#import "HomeViewController.h"
#import "SettingViewController.h"
#import "ProfileViewController.h"

@interface ContainerViewController : UIViewController<MenuViewControllerDeligate,HomeViewControllerDeligate>
//@property (weak, nonatomic) IBOutlet UIButton *sideMenuButton;

@end

