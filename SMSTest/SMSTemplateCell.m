//
//  SMSTemplateCell.m
//  IMAPPMIOS
//
//  Created by zhaowei on 16/9/12.
//  Copyright © 2016年. All rights reserved.
//

#import "SMSTemplateCell.h"

@implementation SMSTemplateCell {
    UIButton *_radio;
    
    UILabel *_templateName;
    
    UIButton *_indicator;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.userInteractionEnabled = YES;
    if (self) {
        _radio = [[UIButton alloc] initWithFrame:CGRectMake(20, 5, 30, 30)];
        _radio.backgroundColor = [UIColor blueColor];
        _templateName = [[UILabel alloc] initWithFrame:CGRectMake(70, 5, 80, 30)];
        _templateContent = [[UILabel alloc] init];
        _templateContent.backgroundColor = [UIColor yellowColor];
        
        _radioSelected = NO;
        _indicator = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 80.0f, 5, 58.0f, 30)];
        [_indicator setTitle:@"展开" forState:UIControlStateNormal];
        
        [_indicator addTarget:self action:@selector(onExpandCell:) forControlEvents:UIControlEventTouchUpInside];
        _indicator.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_radio];
        [self.contentView addSubview:_templateName];
        [self.contentView addSubview:_templateContent];
        [self.contentView addSubview:_indicator];
    }
    return  self;
}

- (void) setCellByTemplateName:(NSString *)templateName andTemplateContent:(NSString *)templateContent{
    _templateContent.text = templateContent;
    _templateName.text = templateName;
    _templateContent.frame = CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, 150);
    _templateContent.hidden = YES;
    _templateContent.numberOfLines = 0;
    _radioSelected = NO;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void) onExpandCell:(SMSTemplateCell*)cell {
    [self.delegate onExpandCell:self];
}

@end
