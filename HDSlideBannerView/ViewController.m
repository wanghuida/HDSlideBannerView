//
//  ViewController.m
//  HDSlideBannerView
//
//  Created by william on 15/2/5.
//  Copyright (c) 2015年 wanghd. All rights reserved.
//

#import "ViewController.h"
#import "HDSlideBannerVIew.h"

@interface ViewController ()<HDSlideBannerViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // prepare data
    NSMutableArray *imgList = [NSMutableArray array];
    [imgList addObject:@"http://pic7.nipic.com/20100517/1383578_225053927034_2.jpg"];
    [imgList addObject:@"http://pic1.ooopic.cn/uploadfilepic/sheying/2009-11-16/OOOPIC_lang2009chao_2009111687174732a8a4e1a3.jpg"];
    [imgList addObject:@"http://img1.3lian.com/img2008/14/04/0104.jpg"];
    
    // init HDSlideBannerView
    CGRect frame = CGRectMake(0, 100, [[UIScreen mainScreen] bounds].size.width, 200);
    HDSlideBannerVIew *bannerView = [[HDSlideBannerVIew alloc] initWithFrame:frame];
    
    // set delegate for tap image
    bannerView.delegate = self;
    // open auto slide and set interval time
    [bannerView openAutoSlideWithTimeInterval:5.0f];
    // set data
    [bannerView setImgList:imgList];
    
    // custom scrollview and pagecontrol
    bannerView.scrollView.backgroundColor = [UIColor whiteColor];
    bannerView.pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    
    [self.view addSubview:bannerView];
    
}

- (void)slideBannerTapIndex:(NSInteger)index {
    NSLog(@"%ld", (long)index);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
