//
//  ViewController.m
//  图片无限轮播器
//
//  Created by 远洋 on 15/12/18.
//  Copyright © 2015年 遇见远洋. All rights reserved.
//

#import "ViewController.h"

#import "YJYYCollectionView.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width

#define kImageCount 10

@interface ViewController ()

//传递给cell的图片数组
@property (nonatomic,strong)NSMutableArray * images;

@end

@implementation ViewController

//懒加载数组
-(NSMutableArray *)images
{
    if (!_images) {
        _images = [NSMutableArray array];
        
        for (int i = 1 ; i < kImageCount+1 ; i++) {
            
            NSString * imageName = [NSString stringWithFormat:@"%02d.jpg",i];
            
            UIImage * image = [UIImage imageNamed:imageName];
            
            [_images addObject:image];
        }
    }
    
    return _images;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.实例化 CollectionView传入 一个frame 和一个图片数组 时长 和你要添加到的view
    [YJYYCollectionView collectionViewWithFrame:CGRectMake(0, 44, kScreenWidth, 300) imageArray:self.images timeInterval:1.5 view:self.view];
    
}


@end
