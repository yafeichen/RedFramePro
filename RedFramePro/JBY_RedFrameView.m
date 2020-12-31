//
//  JBY_RedFrameView.m
//  JBYTeacher_iOS
//
//  Created by apple on 2020/12/23.
//  Copyright © 2020 陈亚飞. All rights reserved.
//

#import "JBY_RedFrameView.h"

@implementation JBY_RedFrameView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.layer.borderColor = [UIColor redColor].CGColor;
        self.layer.borderWidth = 2.f;
        self.layer.cornerRadius = 3.f;
        self.layer.masksToBounds = YES;
    }
    return self;
}

@end
