//
//  ManagerSMSSectionModel.h
//  IMAPPMIOS
//
//  Created by zhawoei on 16/9/14.
//  Copyright © 2016年. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ManagerSMSSectionModel : NSObject
@property (nonatomic, strong) NSString *sectionTitle; //section 显示的文字标题
@property (nonatomic) BOOL sectionStatus;//状态 表示是否展开section下的内容
@property (nonatomic) BOOL sectionRadioSelected;//section 左侧的 radio按钮是否选择

- (instancetype) initWithSectionTitle:(NSString *)title;
@end
