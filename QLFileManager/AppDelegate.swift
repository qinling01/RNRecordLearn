//
//  AppDelegate.swift
//  QLFileManager
//
//  Created by Mac on 2019/12/17.
//  Copyright © 2019 QinL. All rights reserved.
//

import UIKit
import Alamofire

/// appdelegate
let appdelegate = UIApplication.shared.delegate as! AppDelegate
public let Swindow = UIApplication.shared.delegate?.window
public let Sbounds = UIScreen.main.bounds
public let Swidth = UIScreen.main.bounds.width
public let Sheight = UIScreen.main.bounds.height
/// 除去导航栏页面高度
public let SheightWithin = Sheight-SafeAreaNavHeight
/// 导航栏高度
public let SafeAreaNavHeight: CGFloat = (Sheight == 812.0 ? 88.0 : 64.0)
/// 状态栏高度
public let SafeAreaNavHeightTop: CGFloat = (Sheight == 812.0 ? 44.0 : 20.0)
/// 底部距边高度（iPhoneX）
public let SafeAreaBottomHeight: CGFloat = (Sheight == 812.0 ? 34.0 : 0.0)
/// 工具栏高度
public let SafeAreaTabBarHeight: CGFloat = (Sheight == 812.0 ? 83.0 : 49.0)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

