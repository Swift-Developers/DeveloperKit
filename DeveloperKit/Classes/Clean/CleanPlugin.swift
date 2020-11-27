//
//  CleanPlugin.swift
//  TODOEN-IELTS-ARIES
//
//  Created by 方林威 on 2020/11/19.
//

//import UIKit
//import HyperionCore
//
//class CleanPlugin: NSObject, HYPPlugin {
//    
//    static func createPluginModule(_ pluginExtension: HYPPluginExtensionProtocol) -> HYPPluginModuleProtocol {
//        return CleanPluginModule(with: pluginExtension)
//    }
//    
//    static func pluginVersion() -> String {
//        return "1.0.0"
//    }
//}
//
//class CleanPluginModule: HYPPluginModule, HYPPluginMenuItemDelegate {
//    
//    func pluginMenuItemSelected(_ pluginView: (UIView & HYPPluginMenuItemProtocol)!) {
//        guard shouldHideDrawerOnSelection() else { return }
////        Env.clearCache {
////            Toast.show(debugExit: "裤裆都清干净了 😃")
////        }
//    }
//    
//    override func pluginMenuItemTitle() -> String {
//        return "清理缓存"
//    }
//    
//    override func pluginMenuItemImage() -> UIImage {
//        return UIImage()
//    }
//}
