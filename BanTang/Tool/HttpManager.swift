//
//  HttpManager.swift
//  BanTang
//
//  Created by baochao on 16/2/29.
//  Copyright © 2016年 io.hzlzh.yunshouyi. All rights reserved.
//

import UIKit

class HttpManager{
    static let sharedInstance = HttpManager()
    
    private func downWithURLString(urlString:String,paraments:NSDictionary?,success:(data:NSDictionary)->Void,fail:(error:NSError)->Void,isGet:Bool){
        let manager = AFHTTPSessionManager()
        manager.requestSerializer = AFJSONRequestSerializer()
        manager.responseSerializer = AFJSONResponseSerializer()
       
        manager.requestSerializer .setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        manager.requestSerializer.timeoutInterval = 10.0;
        UIApplication.sharedApplication().pushNetworkActivity()
        if isGet{
            manager.GET(urlString, parameters:paraments, progress: { (pro:NSProgress) -> Void in
                
                }, success: { (task:NSURLSessionTask?,data:AnyObject?) -> Void in
                    success(data:data! as! NSDictionary)
                    UIApplication.sharedApplication().popNetworkActivity()
                }) { (task:NSURLSessionTask?,error:NSError) -> Void in
                    fail(error:error)
                    UIApplication.sharedApplication().popNetworkActivity()
            }
        }else{
            manager.POST(urlString, parameters:paraments, progress: { (pro:NSProgress) -> Void in
                
                }, success: { (task:NSURLSessionTask?,data:AnyObject?) -> Void in
                    success(data:data! as! NSDictionary)
                    UIApplication.sharedApplication().popNetworkActivity()
                }) { (task:NSURLSessionTask?,error:NSError) -> Void in
                    UIApplication.sharedApplication().popNetworkActivity()
                    fail(error:error)
            }
        }
    }
    
    func GET(urlString:String,paraments:NSDictionary,success:(data:NSDictionary)->Void,fail:(error:NSError)->Void){
        downWithURLString(urlString, paraments:paraments, success: { (data) -> Void in
            success(data:data)
            }, fail: { (error) -> Void in
            fail(error:error)
            }, isGet:true)
    }
    
    func POST(urlString:String,paraments:NSDictionary,success:(data:NSDictionary)->Void,fail:(error:NSError)->Void){
        downWithURLString(urlString, paraments:paraments, success: { (data) -> Void in
            success(data:data)
            }, fail: { (error) -> Void in
                fail(error:error)
            }, isGet:false)
    }
}
