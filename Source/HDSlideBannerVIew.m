//
//  HDSlideBannerVIew.m
//  HDSlideBannerView
//
//  Created by william on 15/2/5.
//  Copyright (c) 2015年 wanghd. All rights reserved.
//

#import "HDSlideBannerVIew.h"
#import <SDWebImage/UIImageView+WebCache.h>


@interface HDSlideBannerVIew ()<UIScrollViewDelegate>

// width and height of view
@property (nonatomic) int vW;
@property (nonatomic) int vH;

// data
@property (strong, nonatomic) NSMutableArray *imageList;
@property (assign, nonatomic) NSInteger imageViewIndex;

@property (strong, nonatomic) NSMutableArray *displayList;

// timer
@property (strong, nonatomic) NSTimer *timer;
@property (nonatomic) BOOL isAutoSlide;
@property (nonatomic) NSTimeInterval autoSlideTimeInterval;

@end


@implementation HDSlideBannerVIew

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.scrollView = [[UIScrollView alloc] init];
    self.pageControl = [[UIPageControl alloc] init];
    return self;
}

- (void)setImgList:(NSArray *)imgList {
    
    if (imgList.count == 0) {
        return;
    }
    
    self.vW = self.bounds.size.width;
    self.vH = self.bounds.size.height;
    self.imageViewIndex = 0;
    
    self.imageList = [NSMutableArray arrayWithArray:imgList];
}


- (void)drawRect:(CGRect)rect {
    
    self.scrollView.frame = self.bounds;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(self.vW * 3, self.vH);
    self.scrollView.delegate = self;
    [self addSubview:self.scrollView];
    
    self.pageControl.frame = CGRectMake(0, self.vH - 30, self.vW, 20);
    self.pageControl.numberOfPages = self.imageList.count;
    self.pageControl.currentPage = 0;
    [self addSubview:self.pageControl];
    
    [self rebuildDisplayContent];
    [self resetTimer];
}



- (void)rebuildDisplayContent {
    
    for (UIView *subview in self.scrollView.subviews) {
        [subview removeFromSuperview];
    }
    
    [self resetDisplayList];
    
    for (UIImageView *imgView in self.displayList) {
        NSInteger i = [self.displayList indexOfObject:imgView];
        imgView.frame = CGRectMake(self.vW * i, 0, self.vW, self.vH);
        [self.scrollView addSubview:imgView];
    }
    
    self.pageControl.currentPage = self.imageViewIndex;
    self.scrollView.contentOffset = CGPointMake(self.vW, 0);
}

- (void)resetDisplayList {
    self.imageViewIndex = [self getImageViewIndex:self.imageViewIndex];
    NSInteger prevIndex = [self getImageViewIndex:self.imageViewIndex - 1];
    NSInteger nextIndex = [self getImageViewIndex:self.imageViewIndex + 1];
    
    NSString *prevImageSrc = [self.imageList objectAtIndex:prevIndex];
    NSString *currImageSrc = [self.imageList objectAtIndex:self.imageViewIndex];
    NSString *nextImageSrc = [self.imageList objectAtIndex:nextIndex];
    
    UIImageView *prevImageView = [self createImageView:prevImageSrc :prevIndex];
    UIImageView *currImageView = [self createImageView:currImageSrc :self.imageViewIndex];
    UIImageView *nextImageView = [self createImageView:nextImageSrc :nextIndex];
    
    self.displayList = [NSMutableArray array];
    [self.displayList addObject:prevImageView];
    [self.displayList addObject:currImageView];
    [self.displayList addObject:nextImageView];
}

- (NSInteger)getImageViewIndex:(NSInteger)index {
    NSInteger c = self.imageList.count;
    return index < 0 ? (c + index) % c : index % c;
}

- (UIImageView *)createImageView:(NSString *)imgSrc :(NSInteger)index {
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView sd_setImageWithURL:[NSURL URLWithString:imgSrc]];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageView:)];
    [imageView addGestureRecognizer:tapGesture];
    imageView.userInteractionEnabled = YES;
    imageView.tag = index;
    
    return imageView;
}

- (void)tapImageView:(UITapGestureRecognizer *)tap {
    UIImageView *imageView = (UIImageView *)tap.view;
    if ([self.delegate respondsToSelector:@selector(slideBannerTapIndex:)]) {
        [self.delegate slideBannerTapIndex:imageView.tag];
    }
}


#pragma mark - UIScrollView Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.x <= 0) {
        self.imageViewIndex -= 1;
        [self rebuildDisplayContent];
    }
    if (scrollView.contentOffset.x >= self.vW * 2) {
        self.imageViewIndex += 1;
        [self rebuildDisplayContent];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self.timer invalidate];
    [self resetTimer];
}

#pragma mark - Timer

- (void)openAutoSlideWithTimeInterval:(NSTimeInterval)timeInterval {
    self.isAutoSlide = YES;
    self.autoSlideTimeInterval = timeInterval;
}

- (void)closeAutoSlide {
    self.isAutoSlide = NO;
    if (self.timer != nil && self.timer.isValid) {
        [self.timer invalidate];
    }
}

- (void)resetTimer {
    if (self.isAutoSlide) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:self.autoSlideTimeInterval
                                                      target:self
                                                    selector:@selector(processAutoSlide)
                                                    userInfo:nil
                                                     repeats:YES];
    }
}

- (void)processAutoSlide {
    [self.scrollView setContentOffset:CGPointMake(self.vW * 2, 0) animated:YES];
}

@end
