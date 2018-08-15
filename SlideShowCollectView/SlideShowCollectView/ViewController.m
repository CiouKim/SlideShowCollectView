//
//  ViewController.m
//  SlideShowCollectView
//
//  Created by Chinalife on 2018/8/15.
//  Copyright © 2018年 qwe. All rights reserved.
//

#import "ViewController.h"
#import "SlideShowView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    NSArray *arr= [[NSArray alloc] initWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", nil];
    
    slideShowView = [[SlideShowView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) data:arr];
    self.view = slideShowView;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
