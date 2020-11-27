//
//  PerformancePlugin.swift
//  TODOEN-IELTS-MAIN
//
//  Created by 方林威 on 2020/6/5.
//

//import GDPerformanceView_Swift
//import HyperionCore
//
//class PerformancePlugin: NSObject, HYPPlugin {
//    
//    static func createPluginModule(_ pluginExtension: HYPPluginExtensionProtocol) -> HYPPluginModuleProtocol {
//        return PerformancePluginModule(with: pluginExtension)
//    }
//    
//    static func pluginVersion() -> String {
//        return ""
//    }
//}
//
//class PerformancePluginModule: HYPPluginModule, HYPPluginMenuItemDelegate {
//    
//    private var isSelected = false
//    
//    required init(with extension: HYPPluginExtensionProtocol) {
//        super.init(with: `extension`)
//        PerformanceMonitor.shared().performanceViewConfigurator.options = .all
//    }
//    
//    func pluginMenuItemSelected(_ pluginView: (UIView & HYPPluginMenuItemProtocol)!) {
//        isSelected.toggle()
//        pluginMenuItem?.setSelected(isSelected, animated: true)
//        switch isSelected {
//        case true:
//            PerformanceMonitor.shared().start()
//            PerformanceMonitor.shared().show()
//            
//        case false:
//            PerformanceMonitor.shared().pause()
//            PerformanceMonitor.shared().hide()
//        }
//    }
//    
//    override func pluginMenuItemTitle() -> String {
//        return "性能监控"
//    }
//    
//    override func pluginMenuItemImage() -> UIImage {
//        return #imageLiteral(resourceName: "developer_performance_icon")
//    }
//}
