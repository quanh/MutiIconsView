//
//  MutiIconsView.h
//  LZM
//
//  Created by Quanhai on 2019/1/21.
//  Copyright © 2019 Quanhai. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MutiIconsDirection) {
    MutiIconsDirectionVertical          = 0,   // 竖向排列 n + n + ...
    MutiIconsDirectionHorizenal,               // 横向排列 n + n + ...
};

typedef NS_ENUM(NSUInteger, MutiIconsType) {
    MutiIconsTypeItems               = 0,   // b图标样式 , 例：首页 上网 门禁 等
    MutiIconsTypeBlocks,                    // 较大的块样式 , 例: 首页 快递 会议室等
    MutiIconsTypeBlocks2,                    // 较大的块样式 , 例：上图 下字
};

struct MutiIconsLayout {
    NSUInteger rowsOneLine;          // 一行个数, MutiIconsTypeItems (默认为 4), MutiIconsTypeBlocks (默认为2)
    MutiIconsDirection direction;    // 横竖向排列
    MutiIconsType    type;           // 图标样式
};
typedef struct MutiIconsLayout MutiIconsLayout;
UIKIT_STATIC_INLINE MutiIconsLayout
MutiLayoutMake(NSUInteger rows, MutiIconsDirection direction, MutiIconsType type);

UIKIT_STATIC_INLINE MutiIconsLayout
MutiLayoutMake(NSUInteger rows, MutiIconsDirection direction, MutiIconsType type){
    MutiIconsLayout layout;
    layout.rowsOneLine = rows;
    layout.direction = direction;
    layout.type = type;
    return layout;
}

struct AllMutiIconsLayout {
    MutiIconsLayout layout;  // layout 样式
    CGFloat itemHeight;      // 单个高度
    CGSize  imageSize;       // 图标大小
    CGFloat veritualMargin;  // 竖向间隔
    CGFloat horizenMargin;   // 横向间隔
    CGFloat itemSpace;       // item间隔
    CGFloat itemLineSpace;   // itemline间隔
};
typedef struct AllMutiIconsLayout AllMutiIconsLayout;
UIKIT_STATIC_INLINE AllMutiIconsLayout
AllMutiIconsLayoutMake(MutiIconsLayout layout, CGFloat itemHeight, CGSize  imageSize, CGFloat veritualMargin, CGFloat horizenMargin, CGFloat itemSpace, CGFloat itemLineSpace);


UIKIT_STATIC_INLINE AllMutiIconsLayout
AllMutiIconsLayoutMake(MutiIconsLayout layout, CGFloat itemHeight, CGSize  imageSize, CGFloat veritualMargin, CGFloat horizenMargin, CGFloat itemSpace, CGFloat itemLineSpace){
    AllMutiIconsLayout allLayout;
    allLayout.layout = layout;
    allLayout.imageSize = imageSize;
    allLayout.itemHeight = itemHeight;
    allLayout.itemSpace = itemSpace;
    allLayout.itemLineSpace = itemLineSpace;
    allLayout.veritualMargin = veritualMargin;
    allLayout.horizenMargin = horizenMargin;
    return allLayout;
}




@class MutiIconsView;
@protocol MutiIconsViewDelegate <NSObject>
- (void)iconsView:(MutiIconsView *)iconsView selectAtIndex:(NSUInteger)index;
@end


NS_ASSUME_NONNULL_BEGIN

@interface MutiIconsView : UIView

@property (nonatomic, copy) NSString *identifer ; /**< 独特标记 **/
@property (nonatomic, strong) UIFont * titleFont ; /**< 标题字体, MutiIconsTypeItems默认为12,  MutiIconsTypeBlocks 默认为16**/
@property (nonatomic, strong) UIColor * titleColor ; /**< 标题颜色 **/
@property (nonatomic, strong) UIFont * subTitleFont ; /**< 标题字体, 默认为10, MutiIconsTypeBlocks生效 **/
@property (nonatomic, strong) UIColor * subTitleColor ; /**< subtitle 颜色, MutiIconsTypeBlocks生效 **/
@property (nonatomic, assign) BOOL pageEnable ; /**< 横向分组 MutiIconsDirectionHorizenal 生效 **/
@property (nonatomic, strong) NSArray <NSString *> * subTitles ; /**< 子标题，MutiIconsTypeBlocks类型下可用  **/
@property (nonatomic, strong) UIColor * blockColor ; /**< 背景色，MutiIconsTypeBlocks类型下可用 **/

@property (nonatomic, weak) id <MutiIconsViewDelegate> delegate;
@property (nonatomic, assign, readonly) CGFloat height ; /**< 高度 **/
@property (nonatomic, assign, readonly) MutiIconsLayout layout ; /**<  **/

/**
 初始化方法

 @param icons 图标， 可以是完整的url(http://...) ， 也可以是图片名称
 @param titles 主标题
 @param layout 结构体
 @return MutiIconsView
 */
- (instancetype)initWithIcons:(NSArray <NSString *> *)icons iconTitles:(NSArray <NSString *> *)titles layout:(MutiIconsLayout)layout NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithFrame:(CGRect)frame icons:(NSArray <NSString *> *)icons iconTitles:(NSArray <NSString *> *)titles layout:(MutiIconsLayout)layout NS_DESIGNATED_INITIALIZER;


// 增强型。 这里可以自定义更多的值
- (instancetype)initWithIcons:(NSArray <NSString *> *)icons iconTitles:(NSArray <NSString *> *)titles allLayout:(AllMutiIconsLayout)layout;

- (instancetype)initWithFrame:(CGRect)frame icons:(NSArray <NSString *> *)icons iconTitles:(NSArray <NSString *> *)titles allLayout:(AllMutiIconsLayout)layout;

// 适配 ios 11
- (void)setNeveAutoAjust;

@end

NS_ASSUME_NONNULL_END
