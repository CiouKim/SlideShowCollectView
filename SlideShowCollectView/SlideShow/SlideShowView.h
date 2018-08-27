//
//  SlideShowView.h
//  SlideShowCollectView
//
//  Created by Chinalife on 2018/8/15.
//  Copyright © 2018年 qwe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GroupMainView.h"
#import "StarScoreView.h"

@class StarScoreView;

@interface SlideShowView : UIView <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, StarScoreViewDelege> {
    UICollectionView *slideShowCollectView;
    NSMutableArray *btnTagArray;
    GroupMainView *moveView;
    UIView *tempView;
    StarScoreView *starScoreView;
}

@property (strong, nonatomic) NSArray *contacts;

- (instancetype)initWithFrame:(CGRect)frame data:(NSArray *)array;

@end
