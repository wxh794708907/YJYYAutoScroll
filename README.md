使用步骤:
1.将 YJYYAutoScroll文件夹 拖入项目

2.导入头文件 #import "YJYYCollectionView.h"

3.调用类方法实现无限轮播:
+(instancetype)collectionViewWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray timeInterval:(CGFloat )timeInterval view:(UIView *)view;

一句话实现图片无限轮播的功能 参考代码如下:
 [YJYYCollectionView collectionViewWithFrame:CGRectMake(0, 44, kScreenWidth, kImageHeight) imageArray:self.images timeInterval:1.5 view:self.view];

//需要传入的参数如下
1.frame:UICollectionView的frame

2.imageArray:数据源 也就是存放图片的数组

3.timeInterval : 自动定时器间隔时长

4.view:要加载到的具体的view

//第一次发东西 不够成熟 肯定会有很多的不足 诚心向大家请教 使用过程中有任何问题可以给我的邮箱发送邮件 
邮件地址:794708907@qq.com

