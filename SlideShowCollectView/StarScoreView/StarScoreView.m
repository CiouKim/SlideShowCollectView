//
//  StarScoreView.m
//  SlideShowCollectView
//
//  Created by Chinalife on 2018/8/27.
//  Copyright © 2018年 qwe. All rights reserved.
//

#import "StarScoreView.h"

#define StarCount  5

@implementation StarScoreView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        btnTagArray = [[NSMutableArray alloc] init];
        [self setupGesture];
    }
    return self;
}

- (void)setStarCount:(int)starCount {
    _starCount = starCount;
    [self setUI];
}

- (void)setUI {
    float gapEdge = 3;
    float OriginalX = 0;
    float OriginalY = 0;
    
    //flexible  size
    int startW = self.frame.size.width /_starCount;
    if (startW > self.frame.size.height) {
        startW = self.frame.size.height;
    }
    
    gapEdge = startW*0.1;
    if ((startW+gapEdge) * _starCount  > self.frame.size.width) {
        startW = (self.frame.size.width/_starCount)*0.9;
        gapEdge = (self.frame.size.width/_starCount)*0.1;
    }
    
    //set orignal
    OriginalY = (self.frame.size.height - startW)/2;
    OriginalX = (self.frame.size.width - (startW*_starCount +gapEdge *(_starCount-1)))/2;
    
    for (int i = 0; i <_starCount ; i++) {
        UIButton *starBtn = [[UIButton alloc] initWithFrame:CGRectMake(i*(startW + gapEdge) + OriginalX, OriginalY, startW , startW)];
        [starBtn setImage:[UIImage imageNamed:@"blackStar.png"] forState:UIControlStateNormal];
        [starBtn setImage:[UIImage imageNamed:@"yallowStar.png"] forState:UIControlStateSelected];
        [starBtn addTarget:self action:@selector(starClick:) forControlEvents:UIControlEventTouchUpInside];
        starBtn.tag = i;
        [self addSubview:starBtn];
        [btnTagArray addObject:starBtn];
    }
}

- (void)setupGesture {
    UIPanGestureRecognizer *starPanRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(starPanGesture:)];
    [starPanRecognizer setMinimumNumberOfTouches:1];
    [starPanRecognizer setMaximumNumberOfTouches:1];
    starPanRecognizer.delegate = self;
    [self addGestureRecognizer:starPanRecognizer];
}

- (void)starClick:(UIButton *)btn {
    [self setBtnStatus:(int)btn.tag+1];
}

- (void)starPanGesture:(UIPanGestureRecognizer *)reg {
    CGPoint touchPoint = [reg locationInView: self];
    if (reg.state == UIGestureRecognizerStateChanged ) {
        [self setBtnStatus:(int)round(touchPoint.x/(self.frame.size.width/_starCount))];
    }
}

- (void)setBtnStatus:(int)index {
    if (index > _starCount) {
        index = _starCount;//last one in roud operation alway more than one unit
    }
    for (UIButton *btn in btnTagArray) {
        if (btn.tag <= index - 1) {
            [btn setSelected:YES];
        } else {
            [btn setSelected:NO];
        }
    }
    
    self.currentStarValue = index;
    [_delegate doDelegate:self];
}


@end
