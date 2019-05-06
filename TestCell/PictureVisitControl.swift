//
//  PictureVisitControl.swift
//  CQWeiBo
//
//  Created by 陈强 on 2018/6/10.
//  Copyright © 2018年 陈强. All rights reserved.
//

import UIKit
import SVProgressHUD
import SnapKit
import Photos

class PictureVisitControl: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orange
    }
    
    var currentIndex:Int?
    var pictureUrls:[URL]?
    
    
    init(index:Int,Urls:[URL]) {
        
        //先初始化本类属性,在初始化父类
        
        if index < Urls.count - 1 {
            currentIndex = index
        }else{
            currentIndex = 0
        }
        
        
        pictureUrls = Urls
        super.init(nibName: nil, bundle: nil)
        setUpUI()
        view.backgroundColor = .white
    }
    
    private func setUpUI(){
        view.addSubview(collectionView)
        view.addSubview(closebtn)
        view.addSubview(SaveBtn)
        collectionView.backgroundColor = UIColor.white
        //设置数据源
        collectionView.dataSource = self;
        collectionView.register(PictureVisitControlCell.self, forCellWithReuseIdentifier: "item")
       
        setlayoutContains()
        
        
        collectionView.layoutIfNeeded()//这个必须先执行，否则没效果
        
        //设置滚动到相对应的位置
        let index:IndexPath = IndexPath.init(row: currentIndex!, section: 0)
        collectionView.scrollToItem(at: index as IndexPath, at:UICollectionView.ScrollPosition.centeredHorizontally, animated:false)
        
    }
    
    /// 设置约束
    private func setlayoutContains(){
        closebtn.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view.snp.bottom).offset(-30)
            make.left.equalTo(20)
            make.width.equalTo(100)
            make.height.equalTo(35)
        }
        
        SaveBtn.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view.snp.bottom).offset(-30)
            make.right.equalTo(self.view.snp.right).offset(-20)
            make.width.equalTo(100)
            make.height.equalTo(35)
        }
        
        collectionView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalTo(0)
        }
  
    }
    
    @objc private func closeAction(){
        dismiss(animated: true, completion: nil)
    }
    
    
    @objc private func SaveAction(){
        
        let index = collectionView.indexPathsForVisibleItems.last!
        let cell:PictureVisitControlCell = collectionView.cellForItem(at: index) as! PictureVisitControlCell
        
        //保存图片到相册
        let img = cell.IMg.image
        UIImageWriteToSavedPhotosAlbum(img!, self, #selector(image(image:didFinishSavingWithError:contextInfo:)), nil)
      //  - (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo;
    }
    
    @objc func image(image:UIImage,didFinishSavingWithError error:NSError?,contextInfo:AnyObject){
        if error != nil {
           SVProgressHUD.showError(withStatus: "保存失败")
        }else
        {
            SVProgressHUD.showSuccess(withStatus: "保存成功")
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private lazy var collectionView:UICollectionView = UICollectionView(frame:CGRect.zero, collectionViewLayout: PicturePrepareLayout())
    
    private lazy var closebtn:UIButton = {
      let btn = UIButton()
        btn.setTitle("关闭", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor.darkGray
        btn.addTarget(self, action: #selector(closeAction), for: UIControl.Event.touchUpInside)
        return btn
    }()
    
    
    private lazy var SaveBtn:UIButton = {
        let btn = UIButton()
        btn.setTitle("保存", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor.darkGray
        btn.addTarget(self, action: #selector(SaveAction), for: UIControl.Event.touchUpInside)
        return btn
    }()

}




class PicturePrepareLayout:UICollectionViewFlowLayout {
    override func prepare() {
        itemSize = UIScreen.main.bounds.size
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        scrollDirection = UICollectionView.ScrollDirection.horizontal
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.isPagingEnabled = true
        collectionView?.bounces = false;
    }
}

//代理方法
extension PictureVisitControl:UICollectionViewDataSource,PictureVisitControlCellDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictureUrls?.count ?? 0
    }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as! PictureVisitControlCell
        cell.PictureVisitDelegate = self
        cell.imageURL = pictureUrls?[indexPath.row]
        return cell
    }
    
    func TapPhotoCloseDismiss(cell: PictureVisitControlCell) {
        dismiss(animated: true, completion: nil)
    }
    
}


