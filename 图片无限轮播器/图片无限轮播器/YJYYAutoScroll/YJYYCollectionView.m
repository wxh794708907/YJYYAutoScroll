//
//  YJYYCollectionView.m
//  图片无限轮播器
//
//  Created by 远洋 on 15/12/18.
//  Copyright © 2015年 遇见远洋. All rights reserved.
//

#import "YJYYCollectionView.h"
#import "YJYYCollectionViewCell.h"
#import "YJYYCollectionViewFlowlayout.h"
#import "YJYYPageControl.h"

#define kYJYYCollectionViewCell @"YJYYCollectionViewCell"

@interface YJYYCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong)NSArray * imageArray;

//全局属性图片滚动到的位置
@property (nonatomic,assign)NSInteger index;

@property (nonatomic,strong)NSTimer * timer;

@property(nonatomic,assign)CGFloat timeInterval;

//为了确定图片高度和宽度
@property (nonatomic,assign)CGSize collectionViewSize;

@property (nonatomic,strong)YJYYPageControl * page;

@end

@implementation YJYYCollectionView

//实例化collectionView的方法
+(instancetype)collectionViewWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray timeInterval:(CGFloat)timeInterval view:(UIView *)view{
    
    //实例化流水布局
    YJYYCollectionViewFlowlayout * flowlayout = [YJYYCollectionViewFlowlayout createFlowlayoutWithClassName:@"YJYYCollectionView"];
   
    //设置itemSize
    flowlayout.itemSize = CGSizeMake(frame.size.width, frame.size.height);
    
    //实例化collectionView
    YJYYCollectionView * collectionView = [[YJYYCollectionView alloc]initWithFrame:frame collectionViewLayout:flowlayout];
    
    //给全局属性赋值
    collectionView.imageArray = imageArray;
    
    collectionView.timeInterval = timeInterval;
    
    //添加定时器
    [collectionView addTimer];
    
    //添加pageController
    YJYYPageControl * page = [YJYYPageControl createPage];
    
    //设置page的总页数
    page.numberOfPages = collectionView.imageArray.count;
    
    //根据图片张数获取page的宽高
    CGSize  pageSize = [page sizeForNumberOfPages:collectionView.imageArray.count];
    
    page.frame = CGRectMake(0, 0, pageSize.width, pageSize.height);
    
    page.center = CGPointMake(collectionView.center.x, CGRectGetMaxY(collectionView.frame)-20);
    
    collectionView.page = page;
    
    collectionView.collectionViewSize = frame.size;
    
    //添加collectionView
    [view addSubview:collectionView];
    
    //添加pageControl
    [view addSubview:page];
    
    return collectionView;
}

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        //设置界面
        [self setUpUI];
    }
    
    return self;
}

-(void)setUpUI
{
    //滚动条取消
    self.showsVerticalScrollIndicator = NO;
    
    self.showsHorizontalScrollIndicator = NO;
    
    //弹簧效果
    self.bounces = NO;
    
    //翻页效果
    self.pagingEnabled = YES;
    
    //设置代理和数据源
    self.dataSource = self;
    
    self.delegate = self;
    
    //注册cell 一般cell我们自定义
    [self registerClass:[YJYYCollectionViewCell class] forCellWithReuseIdentifier:kYJYYCollectionViewCell];
    
    self.index = 1000;
    
    NSIndexPath * indexPath = [NSIndexPath indexPathForItem:self.index inSection:0];
    
    //默认一开始滚动到第1000张图片的位置
    [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
}

-(void)addTimer
{
    NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:self.timeInterval target:self selector:@selector(scrollImage) userInfo:nil repeats:YES];
    
    //添加到运行循环
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    
    self.timer = timer;
}

-(void)deleteTimer
{
    [self.timer invalidate];
    
    self.timer = nil;
}


//计时器的方法 自动滚动图片
-(void)scrollImage
{
    //调用计时器方法是 让图片索引++ 滚动图片
    self.index++;
    
    NSIndexPath *indexpath = [NSIndexPath indexPathForItem:self.index inSection:0];
    
    [self scrollToItemAtIndexPath:indexpath atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    
    self.page.currentPage = self.index%self.imageArray.count;
}

//数据源方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    //因为图片需要无限滚动 所以 返回一个无限大的数
    return 1000*1000;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
 
    YJYYCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:kYJYYCollectionViewCell forIndexPath:indexPath];
    
    //取出图片赋值给cell
    cell.image = self.imageArray[indexPath.item%self.imageArray.count];
    
    cell.imageSize = self.collectionViewSize;
    
    return cell;
}


//当手指拖动图片时
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    [self deleteTimer];
}

//滚动结束之后发送通知 让控制器接收通知 设置page的当前页数
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x/scrollView.bounds.size.width;
    
    self.index = index;
    
    self.page.currentPage = self.index%self.imageArray.count;
    
    [self addTimer];
}




@end
