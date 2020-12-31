//
//  ViewController.m
//  RedFramePro
//
//  Created by apple on 2020/12/31.
//

#import "ViewController.h"
#import "BGImgageView.h"
#import "JBY_RedFrameView.h"

@interface ViewController ()

@property (nonatomic, strong) BGImgageView *bgImgageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.bgImgageView = [[BGImgageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:self.bgImgageView];
        //画红框
        __block NSMutableArray * redFramViewArr = [NSMutableArray array];
    __weak typeof(self) weakSelf = self;
        self.bgImgageView.pyOperateViewDrawRedFrameBegin_block = ^(CGPoint beginPoint) {//开始画
            __strong typeof(self) strongSelf = weakSelf;
            JBY_RedFrameView *redFrameView = [[JBY_RedFrameView alloc] initWithFrame:CGRectMake(beginPoint.x, beginPoint.y, 0, 0 )];
            redFrameView.beginPoint = beginPoint;
            [redFramViewArr addObject:redFrameView];
            [strongSelf.bgImgageView.contenImg addSubview:redFrameView];
        };
        self.bgImgageView.pyOperateViewDrawRedFrame_block = ^(CGSize size, CGPoint localPoint) {//正在画
            JBY_RedFrameView *redFrameView = [redFramViewArr lastObject];
            float width = redFrameView.frame.size.width;
            float height = redFrameView.frame.size.height;
            if (redFrameView.beginPoint.y>localPoint.y) {
                redFrameView.frame = CGRectMake(redFrameView.beginPoint.x, localPoint.y,width + size.width, redFrameView.beginPoint.y-localPoint.y);
            }else{
                redFrameView.frame = CGRectMake(redFrameView.beginPoint.x, redFrameView.beginPoint.y, width + size.width, localPoint.y-redFrameView.beginPoint.y);
            }
            if (redFrameView.beginPoint.x>localPoint.x) {
                redFrameView.frame = CGRectMake(localPoint.x, localPoint.y,redFrameView.beginPoint.x-localPoint.x, redFrameView.beginPoint.y-localPoint.y);
            }else{
                redFrameView.frame = CGRectMake(redFrameView.beginPoint.x, redFrameView.beginPoint.y, localPoint.x - redFrameView.beginPoint.x, localPoint.y-redFrameView.beginPoint.y);
            }
        };
        self.bgImgageView.PYOperateViewDrawRedFrameEnd_block = ^{//结束画
    
        };
}


@end
