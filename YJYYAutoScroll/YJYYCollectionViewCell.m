//
//  YJYYCollectionViewCell.m
//  图片无限轮播器
//
//  Created by 远洋 on 15/12/18.
//  Copyright © 2015年 遇见远洋. All rights reserved.
//

#import "YJYYCollectionViewCell.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@interface YJYYCollectionViewCell()

@property (nonatomic,weak)UIImageView * imageView;

@end

@implementation YJYYCollectionViewCell

//初始化方法
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //设置自定义的属性 如图片
        [self setUpUI];
        
    }
    return  self;
}

//设置界面
-(void)setUpUI
{
    //添加图片
    UIImageView * imageView = [[UIImageView alloc]init];
    
    [self.contentView addSubview:imageView];
    
    self.imageView = imageView;
    
}


//重写外界传入的图片数组的setter方法 给imageView设置图片
-(void)setImage:(UIImage *)image
{
    _image = image;
    
    self.imageView.image = image;
    
}

//设置子视图frame
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.frame = CGRectMake(0, 0, self.imageSize.width, self.imageSize.height);
}

@end
