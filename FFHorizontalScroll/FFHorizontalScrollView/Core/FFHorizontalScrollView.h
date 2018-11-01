//
//  FFHorizontalScrollView.h
//  NetWork
//
//  Created by jisa on 2018/10/29.
//  Copyright © 2018年 jisa. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FFHorizontalScrollView : UIView

/**
 展示的信息
 */
@property (nonatomic, strong) NSString *showInfo;

/**
 是否展示小喇叭图标，默认展示
 */
@property (nonatomic, assign) BOOL      isShowTrumput;

/**
 背景色：默认的是黑色50%的透明度
 */
@property (nonatomic, strong) UIColor  *bgColor;

/**
 字体颜色： 默认的字体颜色
 */
@property (nonatomic, strong) UIColor  *textColor;


/**
 字号：默认是12号
 */
@property (nonatomic, assign) CGFloat   fontSize;


/**
 item间距: 默认的间距是40
 */
@property (nonatomic, assign) CGFloat   itemDistance;
@end

NS_ASSUME_NONNULL_END
