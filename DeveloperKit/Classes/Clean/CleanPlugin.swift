//
//  CleanPlugin.swift
//  TODOEN-IELTS-ARIES
//
//  Created by 方林威 on 2020/11/19.
//

import UIKit
import HyperionCore

class CleanPlugin: NSObject, HYPPlugin {
    
    static func createPluginModule(_ pluginExtension: HYPPluginExtensionProtocol) -> HYPPluginModuleProtocol {
        return CleanPluginModule(with: pluginExtension)
    }
    
    static func pluginVersion() -> String {
        Bundle(for: BundleToken.self).object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String ?? ""
    }
}

class CleanPluginModule: HYPPluginModule, HYPPluginMenuItemDelegate {
    
    func pluginMenuItemSelected(_ pluginView: (UIView & HYPPluginMenuItemProtocol)!) {
        guard shouldHideDrawerOnSelection() else { return }
        DPClean.task?()
    }
    
    override func pluginMenuItemTitle() -> String {
        return "清理缓存"
    }
    
    override func pluginMenuItemImage() -> UIImage {
        .resources(for: "developer_clean_icon")
    }
}

public enum DPClean {
    
    fileprivate static var task: (() -> Void)?
    
    public static func config(_ task: @escaping (() -> Void)) {
        DPClean.task = task
    }
}
