//
//  SceneDelegate.m
//  SideMenu
//
//  Created by Htet Moe Phyu on 25/11/2021.
//

#import "SceneDelegate.h"
#import "ContainerViewController.h"
@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
   
    UIWindowScene * wscene = [[UIWindowScene alloc]initWithSession:session connectionOptions:connectionOptions];
    [self.window setWindowScene:wscene];
    
    ContainerViewController *vc = [[ContainerViewController alloc] init];
    
    //MenuViewController *vc = [[MenuViewController alloc] init];
    
    //self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];
    //self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //ContainerViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ContainerViewController"];
    
    //UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
   
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
}

@end
