//
//  CategoryView.m
//  SlideShowCollectView
//
//  Created by Chinalife on 2018/8/20.
//  Copyright © 2018年 qwe. All rights reserved.
//

#import "CategoryView.h"

@implementation CategoryView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
//        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setupUI {
    closeButton = [[UIButton alloc] init];
    closeButton.backgroundColor = [UIColor redColor];
    [closeButton setTitle:@"X" forState:UIControlStateNormal];
    closeButton.layer.cornerRadius = 10;
    closeButton.layer.masksToBounds = true;
    [closeButton addTarget:self action:@selector(closeView:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:closeButton];
}

- (void)layoutSubviews {
        closeButton.frame = CGRectMake(self.frame.size.width - 18 , 5, 15, 15);
}

- (void)closeView:(UIButton *)btn {
    [self moveView:self withRect:CGRectMake(self.frame.size.width, self.frame.size.height, 0, 0)];
}

- (void)moveView:(UIView*)v withRect:(CGRect)rect {
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^ {
                         v.frame = rect;
                     } completion:^(BOOL finished) {
                     }];
}



@end
