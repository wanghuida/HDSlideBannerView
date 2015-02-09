HDSlideBannerView
=============

A Common Slide Banner View. Generally , as Home Advertising.


Examples
---------
```objc

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

// display banner
[self.view addSubview:bannerView];

```


Setup Instructions
------------------
Install with [CocoaPods](http://cocoapods.org) by adding the following to your Podfile:

``` ruby
pod 'HDSlideBannerVIew', '~> 1.0.0'
```

or add manually: 

Add `HDSlideBannerView.h` & `HDSlideBannerView.m` to your project.

MIT License
-----------
    The MIT License (MIT)

    Copyright (c) 2015 William

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.

