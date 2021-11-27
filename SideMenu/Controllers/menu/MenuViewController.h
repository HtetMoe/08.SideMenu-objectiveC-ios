//
//  MenuViewController.h
//  SideMenu
//
//  Created by Htet Moe Phyu on 25/11/2021.

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MenuViewControllerDeligate <NSObject>
    -(void)didSelectMenuItem:(NSString *)menuName;
@end

@interface MenuViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic,retain) id<MenuViewControllerDeligate> delegate;
@end

NS_ASSUME_NONNULL_END
