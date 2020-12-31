//
//  BGImgageView.h
//  RedFramePro
//
//  Created by apple on 2020/12/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^PYOperateViewDrawRedFrameBeginBlock)(CGPoint beginPoint);//画红框---开始;
typedef void(^PYOperateViewDrawRedFrameBlock)(CGSize size,CGPoint localPoint);//画红框---size正在变化;
typedef void(^PYOperateViewDrawRedFrameEndBlock)(void);//画红框----结束;

@interface BGImgageView : UIView

@property (nonatomic, strong) UIImageView             *contenImg;

@property (nonatomic, copy) PYOperateViewDrawRedFrameBeginBlock                     pyOperateViewDrawRedFrameBegin_block;//画红框开始
@property (nonatomic, copy) PYOperateViewDrawRedFrameBlock                          pyOperateViewDrawRedFrame_block;//画红框size变化
@property (nonatomic, copy) PYOperateViewDrawRedFrameEndBlock                       PYOperateViewDrawRedFrameEnd_block;//画红框结束

@end

NS_ASSUME_NONNULL_END
