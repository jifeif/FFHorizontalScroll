//
//  FFHorizontalScrollViewCollectionViewCell.h
//  FFHorizontalScroll
//
//  Created by jisa on 2018/11/5.
//  Copyright © 2018 jisa. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
extern NSString * const FFHorizontalScrollViewCollectionViewCell_Identity;
@interface FFHorizontalScrollViewCollectionViewCell : UICollectionViewCell

/**
 字号
 */
@property (nonatomic, assign) CGFloat fontsize;

/**
 文字颜色
 */
@property (nonatomic, strong) UIColor *textColor;

/**
 展示的信息
 */
@property (nonatomic, strong) NSString *showInfo;
@end

NS_ASSUME_NONNULL_END
