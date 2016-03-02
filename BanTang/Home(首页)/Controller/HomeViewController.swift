//
//  HomeViewController.swift
//  BanTang
//
//  Created by baochao on 16/2/29.
//  Copyright © 2016年 BanTang. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    private var tableView:UITableView!
    private var dataArray:NSArray!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bulidTableView()
        settingNav()
        loadHomeData()
        
    }
    
    private func loadHomeData(){
        weak var tmpSelf = self
        LoadHomeData.homeData.loadHomeData({ (data) -> Void in
            tmpSelf?.dataArray = data
            self.tableView.reloadData()
        }) { (error) -> Void in
            print(error)
        }
    }
    
    private func settingNav(){
        //开始时将navigationBar的透明度设置为0
        self.navigationController?.navigationBar.setBackgroundImage(UIImage.imageWitBgColor(UIColor.colorWithCustom(228, g: 57, b: 65, alpha:0)), forBarMetrics:.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage.imageWitBgColor(UIColor.colorWithCustom(228, g: 57, b: 65, alpha:0))
    }
    
    private func bulidTableView(){
        self.automaticallyAdjustsScrollViewInsets = false
        tableView = UITableView(frame: CGRectMake(0, 0, ScreenWidth, ScreenHeight-49), style:UITableViewStyle.Plain)
        tableView.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension HomeViewController:UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate{
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style:.Default, reuseIdentifier:"cell")
        cell.textLabel?.text = "测试"
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if(section == 0){
//            return 1
//        }else{
            return 20
//        }

    }
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 2
//    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        if(section == 0){
            let homeHeader = HomeHeaderView()
            if self.dataArray != nil{
                homeHeader.dataArray = self.dataArray
            }
            homeHeader.frame = CGRectMake(0, 0, ScreenWidth,200)
            return homeHeader
//        }else{
//            let bgView = UIView.init(frame:CGRectMake(0, 0, ScreenWidth,50))
//            bgView.backgroundColor = UIColor.cyanColor()
//            return bgView
//        }
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        if section == 0{
            return 300
//        }else{
//            return 50
//        }
    }


    func scrollViewDidScroll(scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        self.navigationController?.navigationBar.setBackgroundImage(nil, forBarMetrics:.Default)
        self.navigationController?.navigationBar.shadowImage = nil
        print(y)
        if(y <= -20){
            //往上滑动，透明度为0
            self.navigationController?.navigationBar.alpha = 0
        }else if( y > 20){
            //滑动到距离为100的时候才显示完全
            self.navigationController?.navigationBar.alpha = y/100
        }else{
            self.navigationController?.navigationBar.alpha = 0
        }
    }
}