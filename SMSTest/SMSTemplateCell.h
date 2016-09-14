//
//  SMSTemplateCell.h
//  IMAPPMIOS
//
//  Created by zhaowei on 16/9/12.
//  Copyright © 2016年. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  SMSTemplateCell;
@protocol SMSTemplateCellProtocol
- (void) onExpandCell:(SMSTemplateCell*) cell;
@end
@interface SMSTemplateCell : UITableViewCell
@property BOOL radioSelected;
@property (nonatomic, strong) UILabel *templateContent;
@property(weak,nonatomic) id<SMSTemplateCellProtocol> delegate;
- (void) setCellByTemplateName:(NSString *)templateName andTemplateContent:(NSString *)templateContent;
@end
