//
//  YJYYPageControl.m
//  图片无限轮播器
//
//  Created by 远洋 on 15/12/19.
//  Copyright © 2015年 遇见远洋. All rights reserved.
//

#import "YJYYPageControl.h"

@implementation YJYYPageControl

+(instancetype)createPage
{
    //初始化方法
    YJYYPageControl * page = [[YJYYPageControl alloc]init];
    
    page.currentPage = 0;
        
    page.currentPageIndicatorTintColor = [UIColor orangeColor];
    
    page.pageIndicatorTintColor = [UIColor cyanColor];
    
    return page;

}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}


@end
