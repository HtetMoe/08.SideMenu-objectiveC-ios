//
//  MenuViewController.m
//  SideMenu
//
//  Created by Htet Moe Phyu on 25/11/2021.
//

#import "MenuViewController.h"

@interface MenuViewController (){
    NSArray<NSString *> *menuOptions;
    NSArray<NSString *> *menuImages;
    UITableView *tableView;
}
@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Dummy data
    menuOptions = [[NSArray alloc]init];
    menuImages  = [[NSArray alloc]init];
    menuOptions = @[@"Home",@"Setting",@"Profile"];
    menuImages  = @[@"home",@"setting",@"user"];
    
    tableView   = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    tableView.delegate   = self;
    tableView.dataSource = self;
    tableView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
    
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return menuOptions.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = menuOptions[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:menuImages[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    [self.delegate didSelectMenuItem:menuOptions[indexPath.row]];
}

@end
