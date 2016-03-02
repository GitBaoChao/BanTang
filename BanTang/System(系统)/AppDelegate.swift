//
//  AppDelegate.swift
//  BanTang
//
//  Created by baochao on 16/2/29.
//  Copyright © 2016年 BanTang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window?.backgroundColor = UIColor.whiteColor()
        window = UIWindow(frame: ScreenBounds)
        window!.makeKeyAndVisible()
        
        //设置全局导航栏的状态
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        
        UINavigationBar.appearance().barTintColor = UIColor(red: 228/255, green: 57/255, blue: 65/255, alpha:1.0)
        
        bulidMainController()
        return true
    }

    private func bulidMainController(){
        
        window?.rootViewController = BTTabController()
    }

    
    func applicationWillResignActive(application: UIApplication) {
        
    }

    func applicationDidEnterBackground(application: UIApplication) {
        
    }

    func applicationWillEnterForeground(application: UIApplication) {
        
    }

    func applicationDidBecomeActive(application: UIApplication) {
        
    }

    func applicationWillTerminate(application: UIApplication) {
        
    }
}


