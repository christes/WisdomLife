//
//  WLDetailMessageCell.m
//  WisdomLife
//
//  Created by boundlessocean on 2017/8/19.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import "WLDetailMessageCell.h"
@interface WLDetailMessageCell ()
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *contentLabel;
@property (strong, nonatomic) IBOutlet UILabel *datelabel;

@end
@implementation WLDetailMessageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor clearColor];
//    self.titleLabel.textColor = WL_COLOR_SUBTITLE;
//    self.titleLabel.textColor = WL_COLOR_TITLE;
//    self.contentLabel.textColor = WL_COLOR_SUBTITLE;
    // Initialization code
}



@end
