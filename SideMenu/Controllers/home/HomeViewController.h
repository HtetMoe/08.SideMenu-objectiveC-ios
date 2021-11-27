//
//  HomeViewController.h
//  SideMenu
//
//  Created by Htet Moe Phyu on 26/11/2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//protocol
@protocol HomeViewControllerDeligate <NSObject>
-(void)menuBtnPressed;
@end

@interface HomeViewController : UIViewController

@property (nonatomic,retain) id<HomeViewControllerDeligate> delegate;
@property(nonatomic)UIButton *sideMenuBtn;

@end

NS_ASSUME_NONNULL_END
