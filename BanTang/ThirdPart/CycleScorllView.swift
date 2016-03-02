//
//  CycleScorllView.swift
//  BanTang
//
//  Created by baochao on 16/3/1.
//  Copyright © 2016年 BanTang. All rights reserved.
//

import UIKit

protocol CycleScorllViewDelegate{
    func selectAtIndex(model:BannerModel)
}

class CycleScorllView: UIView,UIScrollViewDelegate{

    private var scrollView:UIScrollView!
    private var leftImageView:UIImageView!
    private var centerImageView:UIImageView!
    private var rightImageView:UIImageView!
    private var pageControl:UIPageControl!
    var placeHolder:String!
    var clickIndex:((model:BannerModel) -> Void)?
    
    var currentImageIndex:Int!
    var imageCount:Int!
    
    var imageArray:NSArray!{
        didSet {
            buildUI()
            buildPageControl()
        }
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
    }
    
    
    
    private func buildUI(){
        
        imageCount = imageArray.count
        
        scrollView = UIScrollView.init(frame: CGRectMake(0, 0, width, height))
        scrollView.pagingEnabled = true
        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSizeMake(3 * ScreenWidth,height)
        scrollView.setContentOffset(CGPointMake(ScreenWidth, 0), animated:false)
        self.addSubview(scrollView)
        
        leftImageView = UIImageView.init(frame: CGRectMake(0, 0, ScreenWidth, height))
        leftImageView.contentMode = .ScaleAspectFit
        let leftModel = imageArray[imageCount - 1] as! BannerModel
        leftImageView.sd_setImageWithURL(NSURL(string:leftModel.photo), placeholderImage:UIImage(named:placeHolder))
        scrollView.addSubview(leftImageView)
        
        centerImageView = UIImageView.init(frame: CGRectMake(ScreenWidth, 0, ScreenWidth, height))
        centerImageView.contentMode = .ScaleAspectFit
        let cenModel = imageArray[0] as! BannerModel
        centerImageView.sd_setImageWithURL(NSURL(string:cenModel.photo), placeholderImage:UIImage(named:placeHolder))
        
        centerImageView.userInteractionEnabled = true
        centerImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action:"clickAtIndex:"))
        scrollView.addSubview(centerImageView)
        
        rightImageView = UIImageView.init(frame: CGRectMake(ScreenWidth * 2, 0, ScreenWidth, height))
        rightImageView.contentMode = .ScaleAspectFit
        let rightModel = imageArray[1] as! BannerModel
        rightImageView.sd_setImageWithURL(NSURL(string:rightModel.photo), placeholderImage:UIImage(named:placeHolder))
        scrollView.addSubview(rightImageView)
        currentImageIndex = 0
        

    }
    
    func clickAtIndex(g:UITapGestureRecognizer){
        let model = imageArray[(g.view?.tag)!] as! BannerModel
        clickIndex!(model: model)
    }
    func buildPageControl(){
        pageControl = UIPageControl.init(frame: CGRectMake(0, 0,30,20))
        pageControl.center = CGPointMake(ScreenWidth/2,170)
        pageControl.currentPage = 0
        pageControl.numberOfPages = self.imageArray.count
        pageControl.pageIndicatorTintColor = UIColor.colorWithCustom(224, g: 224, b: 224, alpha: 1.0)
        pageControl.currentPageIndicatorTintColor = UIColor.colorWithCustom(251, g: 75, b: 80, alpha: 1.0)
        self.addSubview(pageControl)
    }

    private func reloadImage(){
        let leftImageIndex:Int
        let rightImageIndex:Int
        
        let offset = scrollView.contentOffset
        if offset.x > ScreenWidth{
            //向右滑动
            currentImageIndex = (currentImageIndex+1) % imageCount
        }else if(offset.x < ScreenWidth){
            currentImageIndex = (currentImageIndex - 1 + imageCount) % imageCount
        }
        let model = imageArray[currentImageIndex] as! BannerModel
        centerImageView.sd_setImageWithURL(NSURL(string:model.photo), placeholderImage:UIImage(named:placeHolder))
        centerImageView.tag  = currentImageIndex
        
        
        leftImageIndex = (currentImageIndex + imageCount - 1) % imageCount
        rightImageIndex = (currentImageIndex + 1) % imageCount
        
        let leftmodel = imageArray[leftImageIndex] as! BannerModel
        let rightmodel = imageArray[rightImageIndex] as! BannerModel
        
        leftImageView.sd_setImageWithURL(NSURL(string:leftmodel.photo), placeholderImage:UIImage(named:placeHolder))
        rightImageView.sd_setImageWithURL(NSURL(string:rightmodel.photo), placeholderImage:UIImage(named:placeHolder))
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        self.reloadImage()
        scrollView.setContentOffset(CGPointMake(ScreenWidth, 0), animated:false)
        pageControl.currentPage = currentImageIndex
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
