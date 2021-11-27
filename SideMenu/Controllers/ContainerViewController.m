//
//  ViewController.m
//  SideMenu
//
//  Created by Htet Moe Phyu on 25/11/2021.

#import "ContainerViewController.h"

@interface ContainerViewController (){
    enum MenuState{
        isOpened,
        isClosed
    };
    
    enum MenuState currentState;
    
    UINavigationController *navVC;
    MenuViewController *menuVC;
    HomeViewController *homeVC;
    SettingViewController *settingVC;
    ProfileViewController *profileVC;
    
    UIView *navView;
    UIView *settingView;
    UIView *profileView;
}
@end

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //state Init
    currentState = isClosed;
    
    //Init vcs
    menuVC = [[MenuViewController alloc]init];
    homeVC = [[HomeViewController alloc]init]; // default vc
    
    [self addChildVCs];
}

-(void)addChildVCs{
    //menu
    menuVC.delegate = self;
    
    [self addChildViewController:menuVC];
    [self.view addSubview:menuVC.view];
    [menuVC didMoveToParentViewController:self];
    
    //home
    homeVC.delegate = self;
    navVC   = [[UINavigationController alloc]initWithRootViewController:homeVC];
    
    [self addChildViewController:navVC];
    [self.view addSubview:navVC.view];
    
    [navVC didMoveToParentViewController:self];
    
    //init
    navView = navVC.view;
    settingView = settingVC.view;
    profileView = profileVC.view;
}

- (void)didSelectMenuItem:(NSString *)menuName{
    
    //NSLog(@"Pressed : %@", menuName);
    [self toggle:nil];
    
    if([menuName isEqual: @"Home"]){
        [self resetToHome];
    }
    else if([menuName isEqual: @"Setting"]){
        [self addSetting];
    }
    else{ // profile
        [self addProfile];
    }
}

//home
-(void)resetToHome{
    //remove setting vc
    UIView *removeSettingView  = [self.view viewWithTag:1];
    [removeSettingView removeFromSuperview];
    
    //remove profile vc
    UIView *removeProfileView  = [self.view viewWithTag:2];
    [removeProfileView removeFromSuperview];
}

//setting
-(void)addSetting{
    UIViewController *vc = [SettingViewController new]; //[[SettingViewController alloc]init];
    [homeVC addChildViewController:vc];
    [homeVC.view addSubview:vc.view];
    vc.view.tag = 1;
    
    vc.view.frame = self.view.frame;
    [vc didMoveToParentViewController:self];
}
//profile
-(void)addProfile{
    UIViewController *vc = [ProfileViewController new]; //[[ProfileViewController alloc]init];
    [homeVC addChildViewController:vc];
    [homeVC.view addSubview:vc.view];
    vc.view.tag = 2;
    
    vc.view.frame = self.view.frame;
    [vc didMoveToParentViewController:self];
}

// menu icon in HomeVC
- (void)menuBtnPressed{
    [self toggle:nil];
}

-(void)toggle:(void (^)(void))completion{
    //NSLog(@"%u", currentState);
    if(currentState == isClosed){
        //do open
        [self openSideMenu];
    }
    else{
        //do close
        [self closeSideMenu];
    }
}

-(void)openSideMenu{
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        CGRect frame      = self->navView.frame;
        frame.origin.x    =  self->homeVC.view.frame.size.width - 100;
        self->navView.frame = frame;
        
    } completion:^(BOOL finished) {
        if(finished){
            self->currentState = isOpened;
        }
    }];
}

-(void)closeSideMenu{
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        CGRect frame = self->navView.frame;
        frame.origin.x = 0;
        self->navView.frame = frame;
        
    } completion:^(BOOL finished) {
        if(finished){
            self->currentState = isClosed;
        }
    }];
}
@end
