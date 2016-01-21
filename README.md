使用步骤:

1.将 YJYYAutoScroll文件夹 拖入项目

2.导入头文件 #import "YJYYCollectionView.h"

3.调用类方法实现无限轮播:
```+(instancetype)collectionViewWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray timeInterval:(CGFloat )timeInterval view:(UIView *)view;
```

一句话实现图片无限轮播的功能 参考代码如下:
``` [YJYYCollectionView collectionViewWithFrame:CGRectMake(0, 44, kScreenWidth, kImageHeight) imageArray:self.images timeInterval:1.5 view:self.view];
```

//需要传入的参数如下

1.frame:UICollectionView的frame

2.imageArray:数据源 也就是存放图片的数组

3.timeInterval : 自动定时器间隔时长

4.view:要加载到的具体的view

注意事项:如果你的导航控制器的第一个子视图是scrollview的时候   系统会自动给scrollview加上64的inset
而且这偏移与第三方的下拉刷新是有冲突的

解决冲突: 
     1.禁止系统偏移 在你的控制器中添加 ‘vc.automaticallyadjustsScrollviewInsets ＝NO’这段代码就可以了 
     2.nav.translucent   把原点下移64 和 ios6一样  （一般不用这个） 

//以前一直在git、CocoaChina上下载别人的东西用 感觉自己一直都没有写点东西给大家分享 特意写了这个分享给大家 因为我觉得这个功能肯定是经常需要用到的，第一次写完这个 上传到CocoaChina上 有很多人下载之后都发邮件跟我说能不能再点击扩展一些功能 例如点击图片跳转控制器，其实不是我不想去集成这些东西 只是我这个人做什么事都很干脆 这个东西是用来实现什么功能的就纯粹实现某个功能 如果想要实现其他功能我觉得可以根据自己的想法再去集成，这样我感觉对代码的侵入性更少。 当然写这个东西肯定是不够成熟 肯定会有很多的不足 诚心向大家请教 使用过程中有任何问题可以给我的邮箱发送邮件 

邮件地址:794708907@qq.com (使用qq邮箱是因为每天登qq能够快速看到邮件)

