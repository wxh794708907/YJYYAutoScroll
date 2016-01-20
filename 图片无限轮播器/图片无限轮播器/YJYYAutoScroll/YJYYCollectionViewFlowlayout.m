//
//  YJYYCollectionViewFlowlayout.m
//  图片无限轮播器
//
//  Created by 远洋 on 15/12/18.
//  Copyright © 2015年 遇见远洋. All rights reserved.
//

#import "YJYYCollectionViewFlowlayout.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width

#define kItemHeight 300

@implementation YJYYCollectionViewFlowlayout

//初始化方法
+(instancetype)createFlowlayoutWithClassName:(NSString *)className
{
    YJYYCollectionViewFlowlayout * flowlayout = [[YJYYCollectionViewFlowlayout alloc]init];
    
    //设置共同的属性 如滚动方向 这个根据实际情况来设置
    flowlayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    if ([className isEqualToString:@"YJYYCollectionView"]) {
        
        //设置最小行和列间距
        flowlayout.minimumLineSpacing = 0;
        
        flowlayout.minimumInteritemSpacing = 0;
        
        //设置组内边距
        flowlayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
    }else {//其他情况 自己根据类名去判断设置不同的属性
        
    }
   
    return flowlayout;
}

@end
