//
//  ManagerSendSMSViewController.m
//
//  Created by zhaowei on 16/9/12.
//  Copyright © 2016年 . All rights reserved.
//

#import "ManagerSendSMSViewController.h"
#import "ManagerSMSSectionModel.h"
#define KFZX_ZHAOWEI01_TEST
#define SMS_TEMPLATE_CELL_HEIGHT 45
@interface ManagerSendSMSViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation ManagerSendSMSViewController {
    NSMutableArray *_sectionModels;
    NSMutableArray *_SMSTemplateContents;//短信模板
    NSMutableArray *_cellHeights;//每个cell的高度
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发送邀请";
#ifdef KFZX_ZHAOWEI01_TEST
    _SMSTemplateContents = [[NSMutableArray alloc] init];
    NSString *content = @"您好，xx向您推荐：下载安装我们的xxx您好，xx向您推荐：下载安装我们的xxx您好，xx向您推荐：下载安装我们的xxx您好，xx向您推荐：下载安装我们的xxx您好，xx向您推荐：下载安装我们的xxx您好，xx向您推荐：下载安装我们的xxx您好，xx向您推荐：下载安装我们的xxx";
    [_SMSTemplateContents addObject:content];
    [_SMSTemplateContents addObject:content];
    [_SMSTemplateContents addObject:content];
    [_SMSTemplateContents addObject:content];
    
    
    
    _cellHeights = [[NSMutableArray alloc] init];
    for (NSString *content in _SMSTemplateContents) {
        CGSize size = [content sizeWithFont:[UIFont systemFontOfSize:13.0f] constrainedToSize:CGSizeMake([UIScreen mainScreen].bounds.size.width-50, 500) lineBreakMode:NSLineBreakByWordWrapping];
        [_cellHeights addObject:[NSNumber numberWithFloat:size.height]];
    }
    
    //初始化置空
    _sectionModels = [[NSMutableArray alloc] init];
    for (int i = 0; i < _SMSTemplateContents.count; i++) {
        ManagerSMSSectionModel *sectionModel = [[ManagerSMSSectionModel alloc] initWithSectionTitle:[NSString stringWithFormat:@"短信模版%d",i]];
        if (i == 0) {
            sectionModel.sectionRadioSelected = YES;
        }
        [_sectionModels addObject:sectionModel];
    }
    
#endif
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_tableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 35)];
    headerView.backgroundColor = [UIColor whiteColor];
    UIButton *radio = [[UIButton alloc] initWithFrame:CGRectMake(17, (SMS_TEMPLATE_CELL_HEIGHT-17)/2, 17, 17)];
    radio.tag = section;
    [radio setBackgroundImage:[UIImage imageNamed:@"chat_record_button_mormal"] forState:UIControlStateNormal];
    if ([_sectionModels[section] sectionRadioSelected]) {
        [radio setBackgroundImage:[UIImage imageNamed:@"chat_record_button_selected"] forState:UIControlStateNormal];
    }
    [radio addTarget:self action:@selector(radioTouchDown:) forControlEvents:UIControlEventTouchDown];
    UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(46, (SMS_TEMPLATE_CELL_HEIGHT-17)/2, [UIScreen mainScreen].bounds.size.width, 17)];
    name.text = [_sectionModels[section] sectionTitle];
    name.font = [UIFont systemFontOfSize:16];
   // name.textColor = [UIColor colorWithHexString:@"333333"];
    UIButton  *indicator = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 34.0f - 20, (SMS_TEMPLATE_CELL_HEIGHT-12)/2, 20, 12)];
    [indicator setBackgroundImage:[UIImage imageNamed:@"arrow_down@2x.png"] forState:UIControlStateNormal];
    if ([_sectionModels[section] sectionStatus]) {
        [indicator setBackgroundImage:[UIImage imageNamed:@"arrow_up@2x.png"] forState:UIControlStateNormal];
    }
    indicator.tag = section;
    [indicator addTarget:self action:@selector(onExpand:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:radio];
    [headerView addSubview:name];
    [headerView addSubview:indicator];
    return headerView;
}

-(UIView*)tableView:(UITableView*)tableView viewForFooterInSection:(NSInteger)section {
    if(section == ([_SMSTemplateContents count]-1))
    {
        UIView *_footerView =[[UIView alloc] initWithFrame:CGRectMake(0.0,0.0,320.0,100.0)];
        _footerView.userInteractionEnabled = YES;
        UIColor *color = [UIColor redColor];
        _footerView.backgroundColor =[UIColor clearColor];
        UIButton *sendInviteButton = [UIButton buttonWithType:UIButtonTypeCustom];
        sendInviteButton.userInteractionEnabled = YES;
        sendInviteButton.backgroundColor = color;
        [sendInviteButton setFrame:CGRectMake(15, 35, [UIScreen mainScreen].bounds.size.width - 30, 40)];
        sendInviteButton.layer.cornerRadius = 2.5;
        sendInviteButton.layer.masksToBounds = YES;
        [sendInviteButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [sendInviteButton setTitle:@"发送" forState:UIControlStateNormal];
        [sendInviteButton addTarget:self action:@selector(sendSM) forControlEvents:UIControlEventTouchUpInside];
        [_footerView addSubview:sendInviteButton];
        return _footerView;
    }
    else
    {   return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return  SMS_TEMPLATE_CELL_HEIGHT;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == [_SMSTemplateContents count]-1) {
        return 100;
    }
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    return [_cellHeights[section] floatValue] + 40;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([_sectionModels[section] sectionStatus] == NO) {
        return 0;
    }
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_SMSTemplateContents count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    NSInteger section = indexPath.section;
    if (row == 0) {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
        UILabel *SMSContentLabel = [[UILabel alloc] init];
        SMSContentLabel.backgroundColor = [UIColor whiteColor];
        SMSContentLabel.numberOfLines = 0;
        
        NSString *labelText = _SMSTemplateContents[section];
        NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:labelText];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:13];
        [attrString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0,labelText.length)];
        SMSContentLabel.attributedText = attrString;
        SMSContentLabel.font = [UIFont systemFontOfSize:14.0f];
        //SMSContentLabel.textColor = [UIColor colorWithHexString:@"666666"];
        SMSContentLabel.frame = CGRectMake(20, 10, [UIScreen mainScreen].bounds.size.width-40, [_cellHeights[row] floatValue]+20);
        [cell.contentView addSubview:SMSContentLabel];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return  cell;
    }
    return  nil;
}


//点击下拉箭头的动作
-(void) onExpand:(id)sender {
    if (![sender isKindOfClass:[UIButton class]]) {
        return;
    }
    UIButton *btn = (UIButton*)sender;
    if ([_sectionModels[btn.tag] sectionStatus] == NO) {
        [_sectionModels[btn.tag] setSectionStatus:YES];
        [btn setBackgroundImage:[UIImage imageNamed:@"arrow_up@2x.png"] forState:UIControlStateNormal];
        [_tableView reloadData];
    } else {
        [_sectionModels[btn.tag] setSectionStatus:NO];
        [btn setBackgroundImage:[UIImage imageNamed:@"arrow_down@2x.png"] forState:UIControlStateNormal];
        [_tableView reloadData];
    }
    
}


- (void)radioTouchDown:(id) sender {
    if (![sender isKindOfClass:[UIButton class]]) {
        return;
    }
    UIButton *btn = (UIButton *)sender;
    [btn setBackgroundImage:[UIImage imageNamed:@"chat_record_button_selected"] forState:UIControlStateNormal];
    for (int i = 0; i < _sectionModels.count; i++) {
        if ([_sectionModels[i] sectionRadioSelected]) {
            [_sectionModels[i] setSectionRadioSelected:NO];
        }
    }
    [_sectionModels[btn.tag] setSectionRadioSelected:YES];
    [_tableView reloadData];
}
//点击发送后的动作
-(void)sendSM
{
    ;
}

@end
