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

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIPageControl *pageControl;

@property (weak, nonatomic) id<HDSlideBannerViewDelegate> delegate;

- (void)setImgList:(NSArray *)imgList;

@end
