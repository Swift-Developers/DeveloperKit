//
//  AppInfoPlugin.swift
//  TODOEN-IELTS-MAIN
//
//  Created by 方林威 on 2020/6/5.
//

import HyperionCore

class AppInfoPlugin: NSObject, HYPPlugin {
    
    static func createPluginModule(_ pluginExtension: HYPPluginExtensionProtocol) -> HYPPluginModuleProtocol {
        return AppInfoPluginModule(with: pluginExtension)
    }
    
    static func pluginVersion() -> String {
        Bundle(for: BundleToken.self).object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String ?? ""
    }
}

class AppInfoPluginModule: HYPPluginModule, HYPPluginMenuItemDelegate {
    
    func pluginMenuItemSelected(_ pluginView: (UIView & HYPPluginMenuItemProtocol)!) {
        guard shouldHideDrawerOnSelection() else { return }
        HyperionManager.sharedInstance()?.togglePluginDrawer()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            AppInfoController.show()
        }
    }
    
    override func pluginMenuItemTitle() -> String {
        return "App信息"
    }
    
    override func pluginMenuItemImage() -> UIImage {
        .resources(for: "developer_info_icon")
    }
}

public enum AppInfo {
    
    static var infos: [Group] { infosClosure() }
    
    static var alertClosure: () -> Void = {}
    static var infosClosure: (() -> [Group]) = { AppInfo.default }
    
    public static func config(_ alertClosure: @escaping () -> Void, infosClosure: @escaping (() -> [Group])) {
        AppInfo.infosClosure = infosClosure
        AppInfo.alertClosure = alertClosure
    }
}

extension AppInfo {
    
    public static let `default` = [
        Group("App信息",
              [
                Row("名称", UIApplication.appName),
                Row("version",  UIApplication.appVersion),
                Row("build",  UIApplication.bundleVersion),
                Row("bundleId",  Bundle.main.bundleIdentifier),
                Row("idfa", UIApplication.IDFA)]
        )
    ]

    public struct Group {
        let title: String
        let rows: [Row]

        init(_ title: String, _ rows: [Row]) {
            self.title = title
            self.rows = rows
        }
    }

    public struct Row {
        let title: String
        let value: String?

        init(_ title: String, _ value: String?) {
            self.title = title
            self.value = value
        }
    }
}
