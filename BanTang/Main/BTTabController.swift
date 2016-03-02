//
//  BTNavController.swift
//  BanTang
//
//  Created by baochao on 16/2/29.
//  Copyright © 2016年 BanTang. All rights reserved.
//

import UIKit

class BTTabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        bulidView()
    }
    
    private func bulidView(){
        let imageArray = ["tab_首页","tab_社区","tab_publish_add","tab_分类","tab_我的"]
        let selectImageArray = ["tab_首页_pressed","tab_社区_pressed","tab_publish_add_pressed","tab_分类_pressed","tab_我的_pressed"]
        let viewNameArray = [HomeViewController(),CommunityViewController(),AddViewController(),ClassifyViewController(),MineViewController()]
        for i in 0..<imageArray.count{
            let ctrl = viewNameArray[i]
            let tab = UITabBarItem(title:nil, image:UIImage(named:imageArray[i])?.imageWithRenderingMode(.AlwaysOriginal), selectedImage:UIImage(named:selectImageArray[i])?.imageWithRenderingMode(.AlwaysOriginal))
            tab.imageInsets = UIEdgeInsets(top:5, left:0, bottom: -5, right: 0)
            ctrl.tabBarItem = tab
            let nav = UINavigationController(rootViewController:ctrl)
            addChildViewController(nav)
        }
    }
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
