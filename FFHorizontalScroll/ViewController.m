//
//  ViewController.m
//  FFHorizontalScroll
//
//  Created by jisa on 2018/10/30.
//  Copyright © 2018年 jisa. All rights reserved.
//

#import "ViewController.h"

#import <FFHorizontalScrollFramework/FFHorizontalScrollView.h>

@interface ViewController ()
@property (nonatomic, strong) FFHorizontalScrollView *vi;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    FFView *vi = [[FFView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    [self.view addSubview:vi];
    self.vi = [[FFHorizontalScrollView alloc] initWithFrame:CGRectMake(0, 100, 375, 30)];
    _vi.showInfo = @"这个是滚动展示的信息......";
    [self.view addSubview:_vi];
//     Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)btn:(id)sender {
    self.vi.textColor = [UIColor redColor];
}

@end
