//
//  NetworkPlugin.swift
//  TODOEN-IELTS-MAIN
//
//  Created by 方林威 on 2020/6/5.
//

import HyperionCore
import Wormholy

class NetworkPlugin: NSObject, HYPPlugin {
    
    static func createPluginModule(_ pluginExtension: HYPPluginExtensionProtocol) -> HYPPluginModuleProtocol {
        return NetworkPluginModule(with: pluginExtension)
    }
    
    static func pluginVersion() -> String {
        Bundle(for: BundleToken.self).object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String ?? ""
    }
}

class NetworkPluginModule: HYPPluginModule, HYPPluginMenuItemDelegate {
    
    func pluginMenuItemSelected(_ pluginView: (UIView & HYPPluginMenuItemProtocol)!) {
        guard shouldHideDrawerOnSelection() else { return }
        HyperionManager.sharedInstance()?.togglePluginDrawer()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: "wormholy_fire")))
        }
    }
    
    override func pluginMenuItemTitle() -> String {
        return "网络日志"
    }
    
    override func pluginMenuItemImage() -> UIImage {
        .resources(for: "developer_network_icon")
    }
}
