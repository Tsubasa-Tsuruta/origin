//
//  AppDelegate.swift
//  Configuration
//
//  Created by Tsubasa Tsuruta on 2016/11/06.
//  Copyright © 2016年 Tsubasa Tsuruta. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var myNavigationController: UINavigationController?
    
    //UserView info
    var name = ""
    var phonetic = ""
    var address = ""
    var number = ""
    
    //AccuntView info
    var bank = ""
    var account = ""
    var code = ""
    var bankNumber = ""
    var lastName = ""
    var firstName = ""
    
    //ChangeView info
    var mailAddress = ""
    var newMailAddress = ""
    var password = ""
    var newPssword = ""
    
    //IdView info
    var image2:UIImage!
    var image3:UIImage!
    


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
       
        let myConfVC: ConfViewController = ConfViewController()
        
        myNavigationController = UINavigationController(rootViewController: myConfVC)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = myNavigationController
        self.window?.makeKeyAndVisible()
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

