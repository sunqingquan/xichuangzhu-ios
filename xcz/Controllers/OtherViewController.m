//
//  MeViewController.m
//  xcz
//
//  Created by hustlzp on 15/10/7.
//  Copyright © 2015年 Zhipeng Liu. All rights reserved.
//

#import "OtherViewController.h"
#import "AboutViewController.h"
#import "XCZLikesViewController.h"
#import "UIColor+Helper.h"
#import <Masonry/Masonry.h>
#import <ionicons/IonIcons.h>

@interface OtherViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation OtherViewController

#pragma mark - LifeCycle

- (void)loadView
{
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createViews];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"其他";
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

#pragma mark - Layout

- (void)createViews
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView = tableView;
    [self.view addSubview:tableView];
    
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - Public Interface

#pragma mark - User Interface

#pragma mark - SomeDelegate

# pragma mark - tableview delegate


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    } else {
        return 3;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [UITableViewCell new];
    
    if (indexPath.section == 0) {
//        NSMutableAttributedString *iconString = [[NSMutableAttributedString alloc] initWithString:ion_ios_star_outline attributes:@{NSFontAttributeName: [IonIcons fontWithSize:17], NSForegroundColorAttributeName: [UIColor colorWithRGBA:0x333333FF]}];
//        NSMutableAttributedString *countString = [[NSMutableAttributedString alloc] initWithString:@"  我的收藏" attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:17]}];
//        [iconString appendAttributedString:countString];
//        UILabel *upvotesLabel = [UILabel new];
//        upvotesLabel.attributedText = iconString;
//        cell.textLabel.attributedText = iconString;
        cell.textLabel.text = @"我的收藏";
    } else {
        if (indexPath.row == 0) {
//            NSMutableAttributedString *iconString = [[NSMutableAttributedString alloc] initWithString:ion_ios_gear_outline attributes:@{NSFontAttributeName: [IonIcons fontWithSize:17], NSForegroundColorAttributeName: [UIColor colorWithRGBA:0x333333FF]}];
//            NSMutableAttributedString *countString = [[NSMutableAttributedString alloc] initWithString:@"  设置" attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:17]}];
//            [iconString appendAttributedString:countString];
//            UILabel *upvotesLabel = [UILabel new];
//            upvotesLabel.attributedText = iconString;
//            cell.textLabel.attributedText = iconString;
            cell.textLabel.text = @"给我们反馈";
        } else if (indexPath.row == 1) {
            cell.textLabel.text = @"去 App Store 给我们评价";
        } else if (indexPath.row == 2) {
            cell.textLabel.text = @"关于";
        }
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            XCZLikesViewController *controller = [XCZLikesViewController new];
            [self.navigationController pushViewController:controller animated:YES];
        }
    } else {
        if (indexPath.row == 0) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:hi@xichuangzhu.com"]];
        } else if (indexPath.row == 1) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/cn/app/xi-chuang-zhu/id912139104"]];
        } else {
            AboutViewController *controller = [AboutViewController new];
            [self.navigationController pushViewController:controller animated:YES];
        }
    }
}

#pragma mark - Internal Helpers

#pragma mark - Getters & Setters


@end
