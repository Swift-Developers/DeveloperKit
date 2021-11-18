//
//  UIApplicationExtension.swift
//  DeveloperKit
//
//  Created by 方林威 on 2020/11/27.
//

import UIKit

extension UIApplication {
    
    /// 应用版本号
    static var appVersion: String {
        Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
    }
    
    /// 编译版本号
    static var bundleVersion: String {
        Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? ""
    }
    
    /// 应用名称
    static var appName: String {
        Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ?? ""
    }
    
    /// 系统版本
    static var osVersion: String {
        ProcessInfo.processInfo.operatingSystemVersionString
    }
}
