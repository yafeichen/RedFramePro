//
//  BGImgageView.m
//  RedFramePro
//
//  Created by apple on 2020/12/31.
//

#import "BGImgageView.h"

@interface BGImgageView ()<UIGestureRecognizerDelegate>

@end

@implementation BGImgageView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.contenImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [self addSubview:self.contenImg];
        self.contenImg.userInteractionEnabled = YES;
        [self loadRedFrameView];
    }
    return self;
}

-(void)loadRedFrameView{
        UIPanGestureRecognizer *imgPan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(imgPangestureMethod:)];
        [self.contenImg addGestureRecognizer:imgPan];
        imgPan.delegate = self;
}

-(void)imgPangestureMethod:(UIPanGestureRecognizer *)pan{
    CGPoint translation = [pan translationInView:self.contenImg];
    CGPoint local = [pan locationInView:self.contenImg];
    CGPoint beginPoint = CGPointMake(0, 0);
    if (pan.state==UIGestureRecognizerStateBegan) {
        beginPoint = local;
        self.pyOperateViewDrawRedFrameBegin_block(local);
    }else if(pan.state==UIGestureRecognizerStateChanged){
        self.pyOperateViewDrawRedFrame_block(CGSizeMake(translation.x, translation.y),local);
    }else if(pan.state==UIGestureRecognizerStateEnded){
        self.PYOperateViewDrawRedFrameEnd_block();
    }
    [pan setTranslation:CGPointZero inView:self.contenImg];

}

@end
