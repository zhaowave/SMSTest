//
//  SendSMSViewController.m
//  SMSTest
//
//  Created by zhaowei on 16/9/13.
//  Copyright © 2016年 Test. All rights reserved.
//

#import "SendSMSViewController.h"

@interface SendSMSViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation SendSMSViewController {
    NSMutableArray *dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    dataArray = [[NSMutableArray alloc] init];
    NSString *selected = @"NO";
    [dataArray addObject:selected];
    [dataArray addObject:selected];
    [dataArray addObject:selected];
    self.title = @"发送邀请";
    //[self loadCellData];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
    self.view.backgroundColor = [UIColor lightGrayColor];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40)];
    headerView.backgroundColor = [UIColor whiteColor];
    UIButton *radio = [[UIButton alloc] initWithFrame:CGRectMake(20, 10, 30, 30)];
    radio.backgroundColor = [UIColor blueColor];
    UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(70, 10, [UIScreen mainScreen].bounds.size.width, 30)];
    name.text = [NSString stringWithFormat:@"短信模板%ld",(long)section+1];
    UIButton  *indicator = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 80.0f, 5, 58.0f, 30)];
    indicator.backgroundColor = [UIColor yellowColor];
    indicator.tag = section;
    [indicator addTarget:self action:@selector(onExpand:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:radio];
    [headerView addSubview:name];
    [headerView addSubview:indicator];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return  40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 20;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([dataArray[section] isEqualToString:@"NO"]) {
        return 0;
    }
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [dataArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    if (row == 0) {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
        cell.textLabel.text = @"fdsafda";
        return  cell;
    }
    return  nil;
}

-(void) onExpand:(id)sender {
    if (![sender isKindOfClass:[UIButton class]]) {
        return;
    }
    UIButton *btn = (UIButton*)sender;
    if ([dataArray[btn.tag] isEqualToString:@"NO"]) {
        dataArray[btn.tag] = @"YES";
        [_tableView reloadData];
    } else {
        dataArray[btn.tag] = @"NO";
        [_tableView reloadData];
    }
    
}
@end
