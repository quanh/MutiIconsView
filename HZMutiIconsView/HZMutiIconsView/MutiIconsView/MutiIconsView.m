//
//  MutiIconsView.m
//  LZM
//
//  Created by Quanhai on 2019/1/21.
//  Copyright © 2019 Quanhai. All rights reserved.
//

#import "MutiIconsView.h"
#import "YYAnimatedImageView+hzImage.h"
#import "Masonry.h"

#define KMutiWidthScale [UIScreen mainScreen].bounds.size.width / 375.f

#pragma mark -  MutiIconsTypeItems
@interface MutiIconCollectionCell : UICollectionViewCell
@property (nonatomic, strong) UIView * containerView ; /**< 容器 **/
@property (nonatomic, strong) YYAnimatedImageView * imageView ; /**< 图标 **/
@property (nonatomic, strong) UILabel * titleLabel ; /**< 标题 **/
@property (nonatomic, assign) CGSize imageSize ; /**< imageSize **/
@end
@implementation MutiIconCollectionCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews{
    [self.contentView addSubview:self.containerView];
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        (void)make.edges;
    }];
    
    [self.containerView addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.containerView);
        make.size.mas_equalTo(CGSizeMake(44.f*KMutiWidthScale, 44.f*KMutiWidthScale));
        make.left.mas_greaterThanOrEqualTo(self.containerView);
    }];
    
    [self.containerView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imageView.mas_bottom).mas_offset(6.f);
        make.centerX.mas_equalTo(self.imageView);
        make.left.mas_greaterThanOrEqualTo(self.containerView);
    }];
}

#pragma mark - setter getter
- (void)setImageSize:(CGSize)imageSize{
    _imageSize = imageSize;
    [self.imageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(_imageSize.width*KMutiWidthScale, _imageSize.height*KMutiWidthScale));
    }];
}

- (YYAnimatedImageView *)imageView{
    if (!_imageView) {
        _imageView = [[YYAnimatedImageView alloc] init];
        _imageView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
    }
    return _imageView;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor darkGrayColor];
    }
    return _titleLabel;
}
- (UIView *)containerView{
    if (!_containerView) {
        _containerView = [[UIView alloc] init];
        _containerView.backgroundColor = [UIColor clearColor];
    }
    return _containerView;
}

@end

#pragma mark -  MutiIconsTypeBlocks
@interface MutiEntranceCollectionCell : UICollectionViewCell
@property (nonatomic, strong) UILabel * titleLabel ; /**< 标题 **/
@property (nonatomic, strong) UILabel * subTitleLabel ; /**< 副标题 **/
@property (nonatomic, strong) YYAnimatedImageView * imageView ; /**< 图标 **/
@property (nonatomic, strong) YYImage * iconImage ; /**< icon **/
@property (nonatomic, assign) CGSize imageSize ; /**< imageSize **/
@end
@implementation MutiEntranceCollectionCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews{
    self.contentView.layer.cornerRadius = 2.f;
    self.contentView.layer.masksToBounds = YES;
    
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).mas_offset(15.f);
        make.bottom.mas_equalTo(self.contentView.mas_centerY).mas_offset(-2.f);
    }];
    
    [self.contentView addSubview:self.subTitleLabel];
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).mas_offset(15.f);
        make.top.mas_equalTo(self.contentView.mas_centerY).mas_offset(2.f);
    }];
    
    [self.contentView addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(32.f*KMutiWidthScale, 32.f*KMutiWidthScale));
        make.top.mas_equalTo(self.contentView).mas_offset(15.f);
        make.right.mas_equalTo(self.contentView).mas_offset(-15.f);
    }];
}

#pragma mark - setter getter
- (void)setIconImage:(YYImage *)iconImage{
    _iconImage = iconImage;
    self.imageView.image = _iconImage;
}

- (void)setImageSize:(CGSize)imageSize{
    _imageSize = imageSize;
    [self.imageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(_imageSize.width*KMutiWidthScale, _imageSize.height*KMutiWidthScale));
    }];
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:16];
//        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor darkGrayColor];
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel{
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] init];
        _subTitleLabel.font = [UIFont systemFontOfSize:10];
//        _subTitleLabel.textAlignment
        _subTitleLabel.textColor = [UIColor lightGrayColor];
    }
    return _subTitleLabel;
}

- (YYAnimatedImageView *)imageView{
    if (!_imageView) {
        _imageView = [[YYAnimatedImageView alloc] init];
        _imageView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.clipsToBounds = YES;
    }
    return _imageView;
}

@end

@interface MutiEntranceCollectionCell2 : UICollectionViewCell
@property (nonatomic, strong) UIView * containerView ; /**< 容器 **/
@property (nonatomic, strong) UILabel * titleLabel ; /**< 标题 **/
@property (nonatomic, strong) YYAnimatedImageView * imageView ; /**< 图标 **/
@property (nonatomic, strong) YYImage * iconImage ; /**< icon **/
@property (nonatomic, assign) CGSize imageSize ; /**< imageSize **/
@end
@implementation MutiEntranceCollectionCell2
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews{
    self.contentView.layer.cornerRadius = 2.f;
    self.contentView.layer.masksToBounds = YES;
    
    [self.contentView addSubview:self.containerView];
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView);
        make.centerY.mas_equalTo(self.contentView);
    }];
    
    [self.containerView addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.containerView).mas_offset(0.f);
        make.size.mas_equalTo(CGSizeMake(32.f*KMutiWidthScale, 32.f*KMutiWidthScale));
        make.centerX.mas_equalTo(self.containerView);
        make.left.mas_greaterThanOrEqualTo(self.containerView.mas_left).mas_offset(0.f);
    }];
    
    [self.containerView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imageView.mas_bottom).mas_offset(5.f);
        make.left.mas_greaterThanOrEqualTo(self.containerView.mas_left).mas_offset(0.f);
        make.bottom.mas_equalTo(self.containerView.mas_bottom).mas_offset(0.f);
        make.centerX.mas_equalTo(self.containerView);
    }];
}

#pragma mark - setter getter
- (void)setIconImage:(YYImage *)iconImage{
    _iconImage = iconImage;
    self.imageView.image = _iconImage;
}
- (void)setImageSize:(CGSize)imageSize{
    _imageSize = imageSize;
    [self.imageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(_imageSize.width*KMutiWidthScale, _imageSize.height*KMutiWidthScale));
    }];
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        //        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor darkGrayColor];
    }
    return _titleLabel;
}

- (YYAnimatedImageView *)imageView{
    if (!_imageView) {
        _imageView = [[YYAnimatedImageView alloc] init];
        _imageView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.clipsToBounds = YES;
    }
    return _imageView;
}
- (UIView *)containerView{
    if (!_containerView) {
        _containerView = [[UIView alloc] init];
        _containerView.backgroundColor = [UIColor clearColor];
    }
    return _containerView;
}

@end

CGFloat const kMutiIconsViewHeight = 95.f; // 总高度
CGFloat const kMutiEntranceHeight = 90.f;  // 总高度
CGFloat const kMutiEntranceHorMargin = 15.f; // 左右间距
CGFloat const kMutiEntranceVerMargin = 10.f; // 上下间距
CGFloat const kMutiEntranceItemSpace = 10.f; // item 横向间距
CGFloat const kMutiEntranceItemLineSpace = 15.f; //item 竖向间距
NSString *const kMutiIconCollectionCell = @"mutiIconCollectionCell";
NSString *const kMutiEntranceCollectionCell = @"mutiEntranceCollectionCell";

@interface MutiIconsView()
<
UICollectionViewDelegate,
UICollectionViewDataSource
>
@property (nonatomic, assign, readwrite) MutiIconsLayout layout ; /**<  **/
@property (nonatomic, assign) AllMutiIconsLayout allLayout ; /**< all layout **/
@property (nonatomic, assign) CGSize itemSize ; /**< cell size **/
@property (nonatomic, strong) UICollectionView * collectionView ; /**< collectionview **/
@property (nonatomic, strong) NSArray * icons ; /**< icons **/
@property (nonatomic, strong) NSArray * titles ; /**< titles **/
// values
@property (nonatomic, assign) CGFloat itemHeight ; /**< 单个高度 **/
@property (nonatomic, assign) CGSize imageSize ; /**< 图标大小 **/
@property (nonatomic, assign) CGFloat horMargin ; /**< 横向 **/
@property (nonatomic, assign) CGFloat verMargin ; /**< 竖向 **/
@property (nonatomic, assign) CGFloat itemSpace ; /**< item space **/
@property (nonatomic, assign) CGFloat itemLineSpace ; /**< item line space **/
@end

@implementation MutiIconsView

- (instancetype)initWithIcons:(NSArray <NSString *> *)icons iconTitles:(NSArray <NSString *> *)titles layout:(MutiIconsLayout)layout{
    if (self = [super init]) {
        self.layout = layout;
        [self loadDefaultSetting];
        _icons = icons;
        _titles = titles;
        [self setupSubviews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame icons:(NSArray <NSString *> *)icons iconTitles:(NSArray <NSString *> *)titles layout:(MutiIconsLayout)layout{
    if (self = [super initWithFrame:frame]) {
        self.layout = layout;
        [self loadDefaultSetting];
        _icons = icons;
        _titles = titles;
        [self setupSubviews];
    }
    return self;
}

- (void)loadDefaultSetting{
    if (self.layout.type==MutiIconsTypeItems){
        self.itemHeight = kMutiIconsViewHeight;
        self.imageSize = CGSizeMake(44.f, 44.f);
        self.horMargin = 0;
        self.verMargin = 0;
        self.itemSpace = 0;
        self.itemLineSpace = 0;
    }else{
        self.itemHeight = kMutiEntranceHeight;
        self.imageSize = CGSizeMake(32.f, 32.f);
        self.horMargin = kMutiEntranceHorMargin;
        self.verMargin = kMutiEntranceVerMargin;
        self.itemSpace = kMutiEntranceItemSpace;
        self.itemLineSpace = kMutiEntranceItemLineSpace;
    }
}

- (instancetype)initWithIcons:(NSArray <NSString *> *)icons iconTitles:(NSArray <NSString *> *)titles allLayout:(AllMutiIconsLayout)layout{
    if (self = [super init]) {
        self.allLayout = layout;
        self.layout = layout.layout;
        self.itemHeight = layout.itemHeight;
        self.imageSize = layout.imageSize;
        self.horMargin = layout.horizenMargin;
        self.verMargin = layout.veritualMargin;
        self.itemSpace = layout.itemSpace;
        self.itemLineSpace = layout.itemLineSpace;
        _icons = icons;
        _titles = titles;
        [self setupSubviews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame icons:(NSArray <NSString *> *)icons iconTitles:(NSArray <NSString *> *)titles allLayout:(AllMutiIconsLayout)layout{
    if (self = [super initWithFrame:frame]) {
        self.allLayout = layout;
        self.layout = layout.layout;
        self.itemHeight = layout.itemHeight;
        self.imageSize = layout.imageSize;
        self.horMargin = layout.horizenMargin;
        self.verMargin = layout.veritualMargin;
        self.itemSpace = layout.itemSpace;
        self.itemLineSpace = layout.itemLineSpace;
        _icons = icons;
        _titles = titles;
        [self setupSubviews];
    }
    return self;
}

- (void)setNeveAutoAjust{
    if (@available(iOS 11.0, *)){
        self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
}

#pragma mark - subviews

- (void)setupSubviews{
    CGFloat totalWidth = (self.frame.size.width==0)? [UIScreen mainScreen].bounds.size.width : self.bounds.size.width;
    CGFloat totalHeight = 0.f;
    NSUInteger lines = 0;
    if (self.layout.type == MutiIconsTypeItems){
        if (self.layout.direction == MutiIconsDirectionHorizenal){
            lines = 1;
            totalHeight = self.itemHeight;
        }
        if (self.layout.direction == MutiIconsDirectionVertical){
            lines = ceil((CGFloat)(self.icons.count)/self.layout.rowsOneLine);
            totalHeight = lines *self.itemHeight;
        }
        self.itemSize = CGSizeMake((totalWidth -(self.layout.rowsOneLine-1)*1.f)/self.layout.rowsOneLine, self.itemHeight);
        [self.collectionView registerClass:[MutiIconCollectionCell class] forCellWithReuseIdentifier:kMutiIconCollectionCell];
    }
    if (self.layout.type >= MutiIconsTypeBlocks){
        CGFloat singleHeight = ceil(self.itemHeight *KMutiWidthScale);
        if (self.layout.direction == MutiIconsDirectionHorizenal){
            lines = 1;
            totalHeight = singleHeight*lines + 2*self.verMargin;
        }
        if (self.layout.direction == MutiIconsDirectionVertical){
            lines = ceil((CGFloat)(self.icons.count)/self.layout.rowsOneLine);
            totalHeight = lines *singleHeight + 2*self.verMargin + (lines -1)*self.itemLineSpace;
        }
        self.itemSize = CGSizeMake((totalWidth -(self.layout.rowsOneLine-1)*self.itemSpace - 2*self.horMargin-1)/self.layout.rowsOneLine, singleHeight);
        if (self.layout.type == MutiIconsTypeBlocks){
            [self.collectionView registerClass:[MutiEntranceCollectionCell class] forCellWithReuseIdentifier:kMutiEntranceCollectionCell];
        }
        if (self.layout.type == MutiIconsTypeBlocks2){
            [self.collectionView registerClass:[MutiEntranceCollectionCell2 class] forCellWithReuseIdentifier:kMutiEntranceCollectionCell];
        }
    }
    _height = totalHeight;
    [self addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        (void)make.edges;
        make.size.mas_equalTo(CGSizeMake(totalWidth, totalHeight));
    }];
}

#pragma mark - delegate datasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.icons.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.layout.type == MutiIconsTypeItems){
        MutiIconCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kMutiIconCollectionCell forIndexPath:indexPath];
        NSString *icon = self.icons[indexPath.row];
        NSString *iconTitle = self.titles[indexPath.row];
        cell.imageView.hzImage = icon;
        cell.titleLabel.text = iconTitle;
        cell.imageSize = self.imageSize;
        [self updateIconsCellStyle:cell];
        return cell;
    }else if (self.layout.type == MutiIconsTypeBlocks){
        MutiEntranceCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kMutiEntranceCollectionCell forIndexPath:indexPath];
        NSString *icon = self.icons[indexPath.row];
        NSString *iconTitle = self.titles[indexPath.row];
        NSString *subTitle = nil;
        if (self.subTitles.count == self.titles.count){
            subTitle =  self.subTitles[indexPath.row];
        }
        cell.titleLabel.text = iconTitle;
        cell.subTitleLabel.text = subTitle;
        cell.imageView.hzImage = icon;
        cell.imageSize = self.imageSize;
        [self updateIconsEntranceCellStyle:cell];
        
        return cell;
    }else if (self.layout.type == MutiIconsTypeBlocks2){
        MutiEntranceCollectionCell2 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kMutiEntranceCollectionCell forIndexPath:indexPath];
        cell.imageSize = self.imageSize;
        cell.imageView.hzImage = self.icons[indexPath.row];
        cell.titleLabel.text = self.titles[indexPath.row];
        [self updateIconsEntranceCell2Style:cell];
        return cell;
    }
    return nil;
}

- (void)updateIconsCellStyle:(MutiIconCollectionCell *)cell{
    if (self.titleFont){
        cell.titleLabel.font = self.titleFont;
    }
    if (self.titleColor){
        cell.titleLabel.textColor = self.titleColor;
    }
}
- (void)updateIconsEntranceCellStyle:(MutiEntranceCollectionCell *)cell{
    if (self.titleFont){
        cell.titleLabel.font = self.titleFont;
    }
    if (self.titleColor){
        cell.titleLabel.textColor = self.titleColor;
    }
    if (self.subTitleFont) {
        cell.subTitleLabel.font = self.subTitleFont;
    }
    if (self.subTitleColor){
        cell.subTitleLabel.textColor = self.subTitleColor;
    }
    if (self.blockColor){
        cell.contentView.backgroundColor = self.blockColor;
    }
}

- (void)updateIconsEntranceCell2Style:(MutiEntranceCollectionCell2 *)cell{
    if (self.titleFont){
        cell.titleLabel.font = self.titleFont;
    }
    if (self.titleColor){
        cell.titleLabel.textColor = self.titleColor;
    }
    if (self.blockColor){
        cell.contentView.backgroundColor = self.blockColor;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.delegate && [self.delegate respondsToSelector:@selector(iconsView:selectAtIndex:)]){
        [self.delegate iconsView:self selectAtIndex:indexPath.row];
    }
}

#pragma mark - setter
- (void)setIcons:(NSArray *)icons{
    _icons = icons;
    if (_titles.count == _icons.count){
        [self setupSubviews];
    }
}
- (void)setTitles:(NSArray *)titles{
    _titles = titles;
    if (_titles.count == _icons.count){
        [self setupSubviews];
    }
}


- (void)setPageEnable:(BOOL)pageEnable{
    _pageEnable = pageEnable;
    if (self.layout.direction == MutiIconsDirectionHorizenal){
        self.collectionView.pagingEnabled = _pageEnable;
    }
}

- (void)setTitleFont:(UIFont *)titleFont{
    _titleFont = titleFont;
    [self.collectionView reloadData];
}

- (void)setTitleColor:(UIColor *)titleColor{
    _titleColor = titleColor;
    [self.collectionView reloadData];
}

- (void)setSubTitles:(NSArray<NSString *> *)subTitles{
    _subTitles = subTitles;
    [self.collectionView reloadData];
}

- (void)setSubTitleFont:(UIFont *)subTitleFont{
    _subTitleFont = subTitleFont;
    [self.collectionView reloadData];
}

- (void)setSubTitleColor:(UIColor *)subTitleColor{
    _subTitleColor = subTitleColor;
    [self.collectionView reloadData];
}

#pragma mark - getter
- (UICollectionView *)collectionView{
    if (!_collectionView ) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = (self.layout.direction==MutiIconsDirectionVertical)? UICollectionViewScrollDirectionVertical : UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = self.itemSize;
        layout.minimumInteritemSpacing = (self.layout.type==MutiIconsTypeItems)? 1.f:self.itemSpace;
        layout.minimumLineSpacing = (self.layout.type ==MutiIconsTypeItems)?0.f :self.itemLineSpace;
        layout.sectionInset = (self.layout.type ==MutiIconsTypeItems)? UIEdgeInsetsZero : UIEdgeInsetsMake(self.verMargin, self.horMargin, self.verMargin, self.horMargin);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.alwaysBounceVertical = NO;
        if (@available(iOS 11.0, *)) {
            [_collectionView setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
        } else {
            // Fallback on earlier versions
        }
    }
    return _collectionView;
}

@end
