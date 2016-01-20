//
//  YJYYCollectionViewCell.h
//  图片无限轮播器
//
//  Created by 远洋 on 15/12/18.
//  Copyright © 2015年 遇见远洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YJYYCollectionViewCell : UICollectionViewCell

//开放一个接口用于接收外界传入的数据 如存放的图片
@property (nonatomic,strong)UIImage * image;

@property (nonatomic,assign)CGSize imageSize;
@end
