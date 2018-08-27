//
//  SlideShowView.m
//  SlideShowCollectView
//
//  Created by Chinalife on 2018/8/15.
//  Copyright © 2018年 qwe. All rights reserved.
//

#import "SlideShowView.h"
#import "SlideShowViewCell.h"
#import "GroupMainView.h"
#import "StarScoreView.h"

static NSString * const cellIdentifier = @"cellIdentifier";

@implementation SlideShowView

- (instancetype)initWithFrame:(CGRect)frame data:(NSArray *)array {
    self = [super initWithFrame:frame];
    if (self) {
        if (_contacts == nil) {
            _contacts = [[NSArray alloc] init];
        }
        _contacts = array;
        
        [self setupUI];
        self.backgroundColor = [UIColor greenColor];
    }
    return self;
}

- (void)setupUI {
    if (slideShowCollectView == nil) {
        UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(self.frame.size.width, 200);
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];

        slideShowCollectView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, self.frame.size.height/3, self.frame.size.width, self.frame.size.height/3) collectionViewLayout:flowLayout];
        slideShowCollectView.dataSource = self;
        slideShowCollectView.delegate = self;
        slideShowCollectView.backgroundColor = [UIColor blueColor];
        [slideShowCollectView setShowsHorizontalScrollIndicator:NO];
        [self addSubview:slideShowCollectView];
    }
    
    if (btnTagArray == nil) {
        btnTagArray = [[NSMutableArray alloc] init];
    }
    
    [btnTagArray removeAllObjects];
    [slideShowCollectView registerClass:[SlideShowViewCell class] forCellWithReuseIdentifier:cellIdentifier];
    
    for (NSString *str in _contacts) {
        UIButton *starBtn = [[UIButton alloc] initWithFrame:CGRectMake(5 + [_contacts indexOfObject:str]*40 + [_contacts indexOfObject:str]*3 , self.frame.size.height/3 - 50, 40, 40)];
        [starBtn setImage:[UIImage imageNamed:@"blackStar.png"] forState:UIControlStateNormal];
        [starBtn setImage:[UIImage imageNamed:@"yallowStar.png"] forState:UIControlStateSelected];
        starBtn.tag = [_contacts indexOfObject:str];
        [starBtn addTarget:self action:@selector(starClick:) forControlEvents:UIControlEventTouchUpInside];
        if ([_contacts indexOfObject:str] == 0) {
            [starBtn setSelected:YES];
        }
        
        [self addSubview:starBtn];
        [btnTagArray addObject:starBtn];
    }
    
    moveView = [[GroupMainView alloc] initWithFrame:CGRectMake(0, 30, self.frame.size.width/2, self.frame.size.height/5)];
    [self addSubview:moveView];
    
    starScoreView = [[StarScoreView alloc] initWithFrame:CGRectMake(20, self.frame.size.height - 100, self.frame.size.width - 40, 60)];
    starScoreView.delegate = self;
    starScoreView.starCount = 10;
    [self addSubview:starScoreView];

}

- (void)starClick:(UIButton *)btn {
    [self setBtnTagStatus:(int)btn.tag];
    [slideShowCollectView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:btn.tag inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}

- (void)setBtnTagStatus:(int)i {
    for (UIButton *button in btnTagArray) {
        if (button.tag == i) {
            [button setSelected:YES];
        } else {
            [button setSelected:NO];
        }
    }
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_contacts count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SlideShowViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.labStr = [NSString stringWithFormat:@"%ld", (long)[indexPath row]+1];;
    return cell;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    *targetContentOffset = scrollView.contentOffset;
    float pageWidth = (float)self.bounds.size.width;
    int minSpace = 10;
    
    int cellToSwipe = (scrollView.contentOffset.x)/(pageWidth + minSpace) + 0.5; // cell width + min spacing for lines
//    if (cellToSwipe < 0) {
//        cellToSwipe = 0;
//    } else if (cellToSwipe >= _contacts.count) {
//        cellToSwipe = (int)_contacts.count - 1;
//    }
    [slideShowCollectView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:cellToSwipe inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    [self setBtnTagStatus:cellToSwipe];
}

#pragma mark - StarScoreViewDelege
-(void)doDelegate:(StarScoreView *)starScoreView {
    NSLog(@"star:>>>>>%d", starScoreView.currentStarValue);
}


@end

