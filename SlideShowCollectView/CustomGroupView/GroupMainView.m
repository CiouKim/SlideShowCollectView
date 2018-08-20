//
//  GroupMainView.m
//  SlideShowCollectView
//
//  Created by Chinalife on 2018/8/20.
//  Copyright © 2018年 qwe. All rights reserved.
//

#import "GroupMainView.h"
#import "CategoryView.h"

@implementation GroupMainView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (void)setupUI {
    if (mainView == nil) {
        mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 5, self.frame.size.width*0.4, self.frame.size.height*0.9)];
        mainView.layer.cornerRadius = 10;
        mainView.layer.masksToBounds = true;
    }
    
    if (categoryView1 == nil) {
        categoryView1 = [[CategoryView alloc] initWithFrame:CGRectMake(self.frame.origin.x + self.frame.size.width*0.4, self.frame.origin.y , 0, 0)];
        categoryView1.layer.cornerRadius = 10;
        categoryView1.layer.masksToBounds = true;
    }
    
    if (categoryView2 == nil) {
        categoryView2 = [[CategoryView alloc] initWithFrame:CGRectMake(self.frame.origin.x + self.frame.size.width*0.4, self.frame.origin.y , 0, 0)];
        categoryView2.layer.cornerRadius = 10;
        categoryView2.layer.masksToBounds = true;
    }

    mainView.backgroundColor = [UIColor grayColor];
    
    //need auto made
    categoryView1.backgroundColor = [UIColor blackColor];
    categoryView1.tag = 1;
    categoryView2.backgroundColor = [UIColor yellowColor];
    categoryView2.tag = 2;
    
    [self addSubview:mainView];
    [self addSubview:categoryView1];
    [self addSubview:categoryView2];
    
    controllView1Btn = [[UIButton alloc] initWithFrame:CGRectMake(3 ,5, 20, 20)];
    [controllView1Btn setImage:[UIImage imageNamed:@"blackStar.png"] forState:UIControlStateNormal];
    [controllView1Btn setImage:[UIImage imageNamed:@"yallowStar.png"] forState:UIControlStateSelected];
    controllView1Btn.tag = 1;
    [controllView1Btn addTarget:self action:@selector(animationClick:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:controllView1Btn];
    
    controllView2Btn = [[UIButton alloc] initWithFrame:CGRectMake(3 ,mainView.frame.size.height - 30, 20, 20)];
    [controllView2Btn setImage:[UIImage imageNamed:@"yallowStar.png"] forState:UIControlStateNormal];
    controllView2Btn.tag = 2;
    [controllView2Btn addTarget:self action:@selector(animationClick:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:controllView2Btn];
    
}

- (void)animationClick:(UIButton *)btn {
    for (UIView *v in self.subviews) {
        if ([v isKindOfClass:[CategoryView class]]) {
            if (v.tag == btn.tag) {
                [self moveView:v withRect:CGRectMake(self.frame.size.width*0.4, 20 , 70, 90)];
            } else {
                [self moveView:v withRect:CGRectMake(self.frame.size.width*0.4, 20 , 0, 0)];
            }
        }
    }
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
