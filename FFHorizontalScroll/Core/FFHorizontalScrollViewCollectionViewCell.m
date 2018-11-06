//
//  FFHorizontalScrollViewCollectionViewCell.m
//  FFHorizontalScroll
//
//  Created by jisa on 2018/11/5.
//  Copyright © 2018 jisa. All rights reserved.
//


#import "FFHorizontalScrollViewCollectionViewCell.h"

NSString * const FFHorizontalScrollViewCollectionViewCell_Identity = @"FFHorizontalScrollViewCollectionViewCellIdentity";

@interface FFHorizontalScrollViewCollectionViewCell ()

/**
 label
 */
@property (weak, nonatomic) IBOutlet UILabel *promptInfoLabel;
@end


@implementation FFHorizontalScrollViewCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

#pragma mark -- setter
- (void)setFontsize:(CGFloat)fontsize {
    _fontsize = fontsize;
    _promptInfoLabel.font = [UIFont systemFontOfSize:fontsize];
}

- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    _promptInfoLabel.textColor = textColor;
}

- (void)setShowInfo:(NSString *)showInfo {
    _showInfo = showInfo;
    _promptInfoLabel.text = showInfo;
}


@end
