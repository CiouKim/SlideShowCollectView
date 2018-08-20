//
//  GroupMainView.h
//  SlideShowCollectView
//
//  Created by Chinalife on 2018/8/20.
//  Copyright © 2018年 qwe. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CategoryView;

@interface GroupMainView : UIView {
    UIView *mainView;
    CategoryView *categoryView1;
    CategoryView *categoryView2;
    
    UIButton *controllView1Btn;
    UIButton *controllView2Btn;
}

@end
