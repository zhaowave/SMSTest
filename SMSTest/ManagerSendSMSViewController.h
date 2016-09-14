//
//  ManagerSendSMSViewController.h
//
//  Created by zhaowei on 16/9/12.
//  Copyright © 2016年. All rights reserved.
//
//发送短信 

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@interface ManagerSendSMSViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSString *mobileNo;
@property (nonatomic, strong) UITableView *tableView;
@end
