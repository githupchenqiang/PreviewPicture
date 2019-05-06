//
//  ViewController.swift
//  TestCell
//
//  Created by 陈强 on 2019/5/6.
//  Copyright © 2019年 陈强. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let array:[URL] = [URL.init(string: "http://www.zongyifile.com/cook/images/banner/eb1c7fa222e64f75a4b2181fbd6798f3.jpg")!,
                           URL.init(string: "http://www.zongyifile.com/cook/images/banner/be26ee60d3e54bda839dd2a0711b4258.jpg")!,
                           URL.init(string: "http://www.zongyifile.com/cook/images/banner/b7312107dddf4f16815a0c396a64040b.jpg")!,
                           URL.init(string: "http://www.zongyifile.com/cook/images/banner/83cf3076e5bf4b36afd336cf68bbb705.jpg")!,
                           URL.init(string: "http://www.zongyifile.com/cook/images/banner/1a1bf94e76314b2b9ad66bfc0f8ea9d6.jpg")!,
                           URL.init(string: "http://www.zongyifile.com/cook/images/banner/29482ba7b6a14e10a2c8ed5bc28cf0fb.jpg")!]
        
        
        let vc = PictureVisitControl(index: 2, Urls: array)
        present(vc, animated: true, completion:  nil)
    }
    
}

