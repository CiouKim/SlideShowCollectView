//
//  StarScoreView.h
//  SlideShowCollectView
//
//  Created by Chinalife on 2018/8/27.
//  Copyright © 2018年 qwe. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StarScoreView;

@protocol StarScoreViewDelege <NSObject>

@optional
- (void) doDelegate:(StarScoreView *)starScoreView;

@end

@interface StarScoreView : UIView <UIGestureRecognizerDelegate>{
    NSMutableArray *btnTagArray;
}

@property (nonatomic, assign) int starCount;
@property (nonatomic, assign) int currentStarValue;

@property (nonatomic, weak) id <StarScoreViewDelege> delegate;

@end
