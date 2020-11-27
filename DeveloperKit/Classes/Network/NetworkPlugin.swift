//
//  NetworkPlugin.swift
//  TODOEN-IELTS-MAIN
//
//  Created by 方林威 on 2020/6/5.
//

//import HyperionCore
//
//class NetworkPlugin: NSObject, HYPPlugin {
//    
//    static func createPluginModule(_ pluginExtension: HYPPluginExtensionProtocol) -> HYPPluginModuleProtocol {
//        return NetworkPluginModule(with: pluginExtension)
//    }
//    
//    static func pluginVersion() -> String {
//        return "1,0,0"
//    }
//}
//
//class NetworkPluginModule: HYPPluginModule, HYPPluginMenuItemDelegate {
//    
//    func pluginMenuItemSelected(_ pluginView: (UIView & HYPPluginMenuItemProtocol)!) {
//        guard shouldHideDrawerOnSelection() else { return }
//        HyperionManager.sharedInstance()?.togglePluginDrawer()
//        
//        NotificationCenter.post(.init(rawValue: "wormholy_fire"))
//    }
//    
//    override func pluginMenuItemTitle() -> String {
//        return "网络日志"
//    }
//    
//    override func pluginMenuItemImage() -> UIImage {
//        return #imageLiteral(resourceName: "developer_network_icon")
//    }
//}
