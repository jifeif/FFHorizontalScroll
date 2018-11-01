//
//  ViewController.m
//  FFHorizontalScroll
//
//  Created by jisa on 2018/10/30.
//  Copyright © 2018年 jisa. All rights reserved.
//

#import "ViewController.h"
#import "FFHorizontalScrollView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    FFHorizontalScrollView *vi = [[FFHorizontalScrollView alloc] initWithFrame:CGRectMake(0, 100, 375, 30)];
    vi.showInfo = @"这个是滚动展示的信息......";
    [self.view addSubview:vi];
    // Do any additional setup after loading the view, typically from a nib.
}


@end
