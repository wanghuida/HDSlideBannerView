//
//  HDSlideBannerVIew.h
//  HDSlideBannerView
//
//  Created by william on 15/2/5.
//  Copyright (c) 2015年 wanghd. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HDSlideBannerViewDelegate <NSObject>

@optional
- (void)slideBannerTapIndex:(NSInteger)index;

@end




@interface HDSlideBannerVIew : UIView

@property (weak, nonatomic) id<HDSlideBannerViewDelegate> delegate;

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIPageControl *pageControl;

- (void)setImgList:(NSArray *)imgList;

- (void)openAutoSlideWithTimeInterval:(NSTimeInterval)timeInterval;

- (void)closeAutoSlide;

@end
