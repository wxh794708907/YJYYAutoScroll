//
//  YJYYCollectionView.h
//  图片无限轮播器
//
//  Created by 远洋 on 15/12/18.
//  Copyright © 2015年 遇见远洋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YJYYPageControl.h"

@class YJYYCollectionViewFlowlayout;

@interface YJYYCollectionView : UICollectionView


//提供一个类方法给外界 实例化一个collectionView 并且封装好实例化流水布局的操作
+(instancetype)collectionViewWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray timeInterval:(CGFloat )timeInterval view:(UIView *)view;

@end
