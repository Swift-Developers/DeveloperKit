//
//  ENVPluginModule.swift
//  TODOEN-IELTS-MAIN
//
//  Created by 方林威 on 2020/6/5.
//
//
//import HyperionCore
//
//class ENVPluginModule: HYPPluginModule, HYPPluginMenuItemDelegate {
//    
//    private lazy var pluginItem: ENVPluginMenuItem = {
//        $0.delegate = self
//        $0.envDelegate = self
//        $0.bind(withTitle: "环境切换", image: #imageLiteral(resourceName: "developer_env_icon"))
//        return $0
//    }( ENVPluginMenuItem() )
//    
//    private var isSelected = false
//    
//    override var pluginMenuItem: (UIView & HYPPluginMenuItemProtocol)? {
//        get { pluginItem }
//    }
//    
//    func pluginMenuItemSelected(_ pluginView: (UIView & HYPPluginMenuItemProtocol)!) {
//        isSelected.toggle()
//        pluginItem.setSelected(isSelected, animated: true)
//    }
//}
//
//
//extension ENVPluginModule: ENVPluginMenuItemDelegate  {
//    
//    func currentAnimationSpeed() -> Env {
//        return .current
//    }
//    
//    func userInitiated(_ env: Env) {
//        guard shouldHideDrawerOnSelection() else { return }
//        HyperionManager.sharedInstance()?.togglePluginDrawer()
////        env.switch()
//    }
//}
