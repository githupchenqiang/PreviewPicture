## PreviewPicture
一个图片预览的小demo
封装了一个图片浏览器,实现了图片的浏览,缩放,支持多张图片的浏览缩放,保存到相册等功能

###实现功能
1.图片浏览,根据图片的大小适应,浏览长图
2.多张图片左右滑动浏览
3.图片的缩放
4.播放gif图片

####实现技术
1.使用UICollectionView作为图片浏览的承载控制器

2.自定义cell显示图片,

3.使用UIScrollerView作为最底层视图 

4.使用UIImageView显示图片

5.使用Kingfisher加载网络图片

6.使用UIImageWriteToSavedPhotosAlbum保存图片到相册

7.使用SVProgressHUD作为保存图片成功的提示

8.使用snapkit作为layout的布局约束

**为什么在cell中要使用UIScrollerView**

1.显示长图片,可以上下滑动浏览图片

2.使用UIScrollerView的代理方法实现图片的缩放功能,

3.使用UIScrollerView的代理方法实现监听图片缩放完成后的居中操作


**效果演示**

![这里写图片描述](https://img-blog.csdn.net/2018061416533525?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2NoZW5xaWFuZ2Jsb2Nr/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

**使用方法**    
```
///index为当前点击了图片数组中的第几张图片,Urls为图片Url地址数组
**Urls必须传入为https或者http的图片地址数组,**
let vc = PictureVisitControl(index: index.row, Urls: Urls as! [URL])
present(vc, animated: true, completion:  nil)
```
