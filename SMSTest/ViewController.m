//
//  ViewController.m
//  SMSTest
//
//  Created by zhaowei on 16/9/13.
//  Copyright © 2016年 Test. All rights reserved.
//

#import "ViewController.h"
#import "SMSTemplateCell.h"
#import "SendSMSViewController.h"
#import "ManagerSendSMSViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController {
    NSMutableArray *cellArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发送邀请";
    [self loadCellData];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) loadCellData {
    cellArray = [[NSMutableArray alloc] init];
    SMSTemplateCell *cell = [[SMSTemplateCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.radioSelected = NO;
    SMSTemplateCell *cell1 = [[SMSTemplateCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell1.radioSelected = NO;
    [cell1 setCellByTemplateName:@"fda" andTemplateContent:@"fd对方的撒发的撒\n对方的撒发的撒fd\nfdsa\nfdsa\n"];
    [cell setCellByTemplateName:@"短信模板1" andTemplateContent:@"fd\n对方的撒发的撒fd\nfdsa\nfdsa\n"];
    
    SMSTemplateCell *cell2 = [[SMSTemplateCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    [cell2 setCellByTemplateName:@"短信模板2" andTemplateContent:@"对方的撒发的撒\nfdrewreqwrewqrewqreqwr\fffff\nfdsa\n"];
    cell2.radioSelected = NO;
    cell.delegate = self;
    cell1.delegate = self;
    [cellArray addObject:cell];
    [cellArray addObject:cell1];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    if ([cellArray[row] templateContent].hidden == NO) {
        return 200;
    }
    return  60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        ManagerSendSMSViewController *viewController = [[ManagerSendSMSViewController alloc] init];
        viewController.mobileNo = @"133333333";
        [self.navigationController pushViewController:viewController animated:YES];
    }
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selected = NO;
    SendSMSViewController *send = [[SendSMSViewController alloc] init];
    [self.navigationController pushViewController:send animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return cellArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    return cellArray[row];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) onExpandCell:(SMSTemplateCell*)cell {
    if ([cell templateContent].hidden == YES) {
        cell.templateContent.hidden = NO;
    }else
        cell.templateContent.hidden = YES;
    [_tableView reloadData];
}

@end
