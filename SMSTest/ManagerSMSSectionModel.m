//
//  ManagerSMSSectionModel.m
//  IMAPPMIOS
//
//  Created by zhaowei on 16/9/14.
//  Copyright © 2016年 ICBC. All rights reserved.
//

#import "ManagerSMSSectionModel.h"

@implementation ManagerSMSSectionModel

- (instancetype) initWithSectionTitle:(NSString *)title {
    self = [super init];
    if (self) {
        _sectionTitle = title;
        _sectionStatus = NO;
        _sectionRadioSelected = NO;
    }
    return self;
}
@end
