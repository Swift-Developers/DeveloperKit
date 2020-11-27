//
//  AppInfoPlugin.swift
//  TODOEN-IELTS-MAIN
//
//  Created by 方林威 on 2020/6/5.
//

//import HyperionCore
//
//class AppInfoPlugin: NSObject, HYPPlugin {
//    
//    static func createPluginModule(_ pluginExtension: HYPPluginExtensionProtocol) -> HYPPluginModuleProtocol {
//        return AppInfoPluginModule(with: pluginExtension)
//    }
//    
//    static func pluginVersion() -> String {
//        return ""
//    }
//}
//
//class AppInfoPluginModule: HYPPluginModule, HYPPluginMenuItemDelegate {
//    
//    func pluginMenuItemSelected(_ pluginView: (UIView & HYPPluginMenuItemProtocol)!) {
//        guard shouldHideDrawerOnSelection() else { return }
//        HyperionManager.sharedInstance()?.togglePluginDrawer()
//        AppInfoController.show()
//    }
//    
//    override func pluginMenuItemTitle() -> String {
//        return "App信息"
//    }
//    
//    override func pluginMenuItemImage() -> UIImage {
//        return #imageLiteral(resourceName: "developer_info_icon")
//    }
//}
