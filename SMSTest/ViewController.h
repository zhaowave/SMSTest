//
//  ViewController.h
//  SMSTest
//
//  Created by zhaowei on 16/9/13.
//  Copyright © 2016年 Test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMSTemplateCell.h"

@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,SMSTemplateCellProtocol>

@property (nonatomic, strong) UITableView *tableView;
@end

