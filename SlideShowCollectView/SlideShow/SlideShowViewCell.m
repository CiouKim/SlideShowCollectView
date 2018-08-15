//
//  SlideShowViewCell.m
//  SlideShowCollectView
//
//  Created by Chinalife on 2018/8/15.
//  Copyright © 2018年 qwe. All rights reserved.
//

#import "SlideShowViewCell.h"

@implementation SlideShowViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor clearColor];
    if (self) {
        markLab = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/2 - self.frame.size.width/8, self.frame.size.height/2 - self.frame.size.width/8, self.frame.size.width/4, self.frame.size.width/4)];
        markLab.font = [UIFont systemFontOfSize:15.0];
        markLab.numberOfLines = 0;
        markLab.textAlignment = NSTextAlignmentCenter;
        markLab.backgroundColor = [UIColor colorWithRed:115.0/255 green:171.0/255 blue:255.0/255 alpha:1.0];
        [self addSubview:markLab];
        
    }
    return self;
}

- (void)setLabStr:(NSString *)labStr {
    _labStr = labStr;
    markLab.text = labStr;
}
@end
