//
//  FFHorizontalScrollView.m
//  FFHorizontalScroll
//
//  Created by jisa on 2018/11/5.
//  Copyright © 2018 jisa. All rights reserved.
//

#import "FFHorizontalScrollView.h"
#import "FFHorizontalScrollViewCollectionViewCell.h"


#define FFHorizontalScrollView_ScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define FFHorizontalScrollView_ScreenHeight ([UIScreen mainScreen].bounds.size.height)

@interface FFHorizontalScrollView ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *aCollectionView;
@property (nonatomic, strong) UIImageView      *aImageView;
@property (nonatomic, strong) CADisplayLink    *displayLink;
@property (nonatomic, strong) NSBundle         *needBundle;

@end

@implementation FFHorizontalScrollView

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self FF_Initialization];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (_aImageView) {
        UIImage *aImage = [self FF_AcquireNeedImage];
        _aImageView.center = CGPointMake(self.iconLeftDistance + aImage.size.width / 2, CGRectGetHeight(self.bounds) / 2);
        _aCollectionView.frame = CGRectMake(self.iconLeftDistance + aImage.size.width + 10, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
    }else {
        _aCollectionView.frame = self.bounds;
    }
    
}

#pragma mark -- method

/**
 初始化
 */
- (void)FF_Initialization {
    self.needBundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"FFHorizontalScroll" ofType:@"bundle"]];
    self.isShowTrumput = YES;
    self.bgColor = [UIColor colorWithWhite:0 alpha:0.5];
    self.textColor = [UIColor whiteColor];
    self.iconLeftDistance = 15;
    self.fontSize = 12;
    self.speed = 1;
    self.itemDistance = 40;
    self.backgroundColor = self.bgColor;
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(FF_UpdateCollectionViewLocation)];
    [self FF_HandleFrequencyForSecond:30];
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    if (_isShowTrumput) {
        [self addSubview:self.aImageView];
    }
    [self addSubview:self.aCollectionView];
}

/**
 更新collectionView的位置。
 */
- (void)FF_UpdateCollectionViewLocation {
    if (self.aCollectionView.contentSize.width > FFHorizontalScrollView_ScreenWidth) {
        // 滚动
        self.aCollectionView.contentOffset = CGPointMake(self.aCollectionView.contentOffset.x + self.speed, 0);
        //回归初始位置
        if (self.aCollectionView.contentSize.width <= self.aCollectionView.contentOffset.x + [self FF_CalculateCellWidth]) {
            self.aCollectionView.contentOffset = CGPointZero;
        }
    }
}

/**
 计算cell的宽度
 */
- (CGFloat)FF_CalculateCellWidth {
    if (self.showInfo.length > 0) {
        return [self.showInfo boundingRectWithSize:CGSizeMake(0, 0) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:self.fontSize]} context:nil].size.width;
    }
    return 0;
}

/**
 CADisplayLink 刷新频率

 @param frequency 频率
 */
- (void)FF_HandleFrequencyForSecond:(NSInteger)frequency {
    if (@available(ios 10.0, *)) {
        self.displayLink.preferredFramesPerSecond = frequency;
    }else {
        self.displayLink.frameInterval = frequency;
    }
}

/**
 获取需要的图片
 */
- (UIImage *)FF_AcquireNeedImage {
    NSString *imageName = [NSString stringWithFormat:@"%@@%@x", @"trumpet", @([UIScreen mainScreen].scale)];
    NSString *path = [self.needBundle pathForResource:imageName ofType:@"png"];
    UIImage *aImage = [UIImage imageWithContentsOfFile:path];
    return aImage;
}

#pragma mark -- collectionView delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1000;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FFHorizontalScrollViewCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:FFHorizontalScrollViewCollectionViewCell_Identity forIndexPath:indexPath];
    cell.showInfo = self.showInfo;
    cell.fontsize = self.fontSize;
    cell.textColor = self.textColor;
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake([self FF_CalculateCellWidth], CGRectGetHeight(self.bounds));
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return self.itemDistance;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(FF_CellClickAtIndexPath:)]) {
        [self.delegate FF_CellClickAtIndexPath:indexPath];
    }
}



#pragma mark -- lazy
- (UICollectionView *)aCollectionView
{
    if (!_aCollectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _aCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        [_aCollectionView registerNib:[UINib nibWithNibName:@"FFHorizontalScrollViewCollectionViewCell" bundle:self.needBundle] forCellWithReuseIdentifier:FFHorizontalScrollViewCollectionViewCell_Identity];
        _aCollectionView.backgroundColor = [UIColor clearColor];
        _aCollectionView.delegate = self;
        _aCollectionView.dataSource = self;
    }
    return _aCollectionView;
}

- (UIImageView *)aImageView {
    if (!_aImageView) {
        UIImage *aImage = [self FF_AcquireNeedImage];
        _aImageView = [[UIImageView alloc] initWithImage:aImage];
        _aImageView.frame = CGRectMake(0, 0, aImage.size.width, aImage.size.height);
    }
    return _aImageView;
}

#pragma mark -- setter
- (void)setShowInfo:(NSString *)showInfo {
    _showInfo = showInfo;
    [self.aCollectionView reloadData];
}

- (void)setIsShowTrumput:(BOOL)isShowTrumput {
    _isShowTrumput = isShowTrumput;
    if (isShowTrumput) {
        [_aImageView removeFromSuperview];
        _aImageView = nil;
    }
}

- (void)setFontSize:(CGFloat)fontSize {
    _fontSize = fontSize;
    [self.aCollectionView reloadData];
}

//- (void)setTextColor:(UIColor *)textColor {
//    _textColor = textColor;
//    [self.aCollectionView reloadData];
//}

//- (void)setItemDistance:(CGFloat)itemDistance {
//    _itemDistance = itemDistance;
//    [self.aCollectionView reloadData];
//}

- (void)setIconLeftDistance:(CGFloat)iconLeftDistance {
    _iconLeftDistance = iconLeftDistance;
    [self setNeedsLayout];
}

- (void)setBgColor:(UIColor *)bgColor {
    _bgColor = bgColor;
    self.backgroundColor = bgColor;
}


@end
