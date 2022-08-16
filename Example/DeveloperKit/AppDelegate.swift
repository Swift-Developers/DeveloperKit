//
//  AppDelegate.swift
//  DeveloperKit
//
//  Created by fanglinwei on 11/27/2020.
//  Copyright (c) 2020 fanglinwei. All rights reserved.
//

import UIKit
import DeveloperKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        DPClean.config {
            print("task")
        }
        
        DPAppInfo.setup(Provider())

        DPEnvironment.config {
            return 2
            
        } selected: { 
            return 0
            
        } title: {
            "环境\($0)"
            
        } switch: {
            print("\($0)")
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

struct Provider: DPAppInfoable {
    
    let sections = [
        DPAppInfo.DPSection("123", [DPAppInfo.DPRow("123", "aasasaasasaasasaasasaasasaasasaasasaasasaasasaasasaasasaasasaasasaasas")])
    ]
    
    func appInfo(pasteboardAt indexPath: IndexPath) {
        print(sections[indexPath.section].rows[indexPath.row])
    }
    
    func appInfo(didSelectRowAt indexPath: IndexPath) {
        print(sections[indexPath.section].rows[indexPath.row])
    }
    
    func appInfos() -> [DPAppInfo.DPSection] {
        sections
    }
}
