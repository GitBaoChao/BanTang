//
//  BannerModel.swift
//  BanTang
//
//  Created by baochao on 16/3/1.
//  Copyright © 2016年 BanTang. All rights reserved.
//

import UIKit

class LoadHomeData:NSObject {
    
     static let homeData = LoadHomeData()
    
     func loadHomeData(success:(data:NSArray)->Void,fail:(error:NSError)->Void){
        HttpManager.sharedInstance.GET(homeUrl, paraments:["page":0,"pagesize":20], success: { (data) -> Void in
            let subDict  = data["data"] as! NSDictionary
            print(subDict)
            let bannerArray = self.dataChangeModel("banner", subDict:subDict)
            let firstPage = self.dataChangeModel("firstpage_element", subDict:subDict)
            let topicArray = self.dataChangeModel("topic", subDict:subDict)
            let category = self.dataChangeModel("category_element", subDict:subDict)
            let bannerBottom = self.dataChangeModel("banner_bottom_element", subDict:subDict)
            
            let array = [bannerArray,bannerBottom,category,firstPage,topicArray]
            
            success(data:array)
            
            }) { (error) -> Void in
            fail(error:error)
        }
    }
    
    private func dataChangeModel(keyString:String,subDict:NSDictionary) -> NSMutableArray{
        let array = NSMutableArray()
        for dataDict in subDict[keyString] as! NSArray{
            let model = BannerModel()
            model.setValuesForKeysWithDictionary(dataDict as! [String : AnyObject])
            array.addObject(model)
        }
        return array
    }
    
}

class BannerModel: NSObject {
    var id:String!
    var title:String!
    var type:String!
    var photo:String!
    var extend:String!
    var index:NSNumber!
    var sub_title:String!
    var islike:Bool!
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
}
