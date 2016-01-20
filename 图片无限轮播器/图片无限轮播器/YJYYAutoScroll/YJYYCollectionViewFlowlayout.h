//
//  YJYYCollectionViewFlowlayout.h
//  图片无限轮播器
//
//  Created by 远洋 on 15/12/18.
//  Copyright © 2015年 遇见远洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YJYYCollectionViewFlowlayout : UICollectionViewFlowLayout

//给外界提供一个类方法实例化一个流水布局 根据类名设置不同的参数
+(instancetype)createFlowlayoutWithClassName:(NSString *)className;

@end
