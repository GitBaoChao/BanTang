//
//  HomeHeaderView.swift
//  BanTang
//
//  Created by baochao on 16/3/1.
//  Copyright © 2016年 BanTang. All rights reserved.
//

import UIKit

class HomeHeaderView: UIView {
    private var cycle:CycleScorllView!
    
    var dataArray:NSArray!{
        didSet {
            
            bulidBanner()
            bulidButtom()
            setLayer()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.backgroundColor = UIColor.whiteColor()
        
    }
    
    private func bulidButtom(){
//        let bannerBottomArray = self.dataArray[1]
//        let space = (ScreenWidth - 4 * CGFloat(HomeBottomItem)) / 5
////        let textSpace = space + 3
//        for i in 0..<bannerBottomArray.count{
//            let imageView = UIImageView(frame: CGRectMake(space + ((space + CGFloat(HomeBottomItem)) * CGFloat(i)),190,CGFloat(HomeBottomItem),CGFloat(HomeBottomItem)))
//            let label = UILabel(frame:CGRectMake(space + ((space + CGFloat(HomeBottomItem)) * CGFloat(i)),CGRectGetMaxY(imageView.frame),CGFloat(HomeBottomItem),CGFloat(HomeBottomItem)))
//            let model = bannerBottomArray[i] as! BannerModel
//            label.text = model.title
//            label.font = UIFont.systemFontOfSize(13)
//            label.textColor = UIColor.colorWithCustom(112, g: 112, b: 112, alpha: 1.0)
//            label.textAlignment = .Center
//            imageView.sd_setImageWithURL(NSURL(string:model.photo), placeholderImage:UIImage(named:placeH))
//            self.addSubview(imageView)
//            self.addSubview(label)
//        }
    }
    
    private func setLayer(){
        let maskLayer = CAShapeLayer()
        let path = UIBezierPath()
        path.moveToPoint(CGPointMake(0,CGFloat(HomeBannerHeight)))
        path.addQuadCurveToPoint(CGPointMake(ScreenWidth,CGFloat(HomeBannerHeight)), controlPoint:CGPointMake(ScreenWidth/2,CGFloat(HomeBannerHeight)-30))
        maskLayer.fillColor = UIColor.whiteColor().CGColor
        //        path.closePath()
        maskLayer.path = path.CGPath
        
        maskLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)
        self.layer.addSublayer(maskLayer)
    }
    private func bulidBanner(){
        cycle = CycleScorllView()
        cycle.frame = CGRectMake(0,0,ScreenWidth,200)
        cycle.placeHolder = "tab_分类"
        cycle.imageArray = self.dataArray[0] as! NSArray
        cycle.clickIndex = {(model) -> Void in
            print(model.title)
        }
        self.addSubview(cycle)
        
    }
    

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
