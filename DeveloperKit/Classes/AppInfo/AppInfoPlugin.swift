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

public protocol DPAppInfoable {
    
    func appInfo(pasteboardAt indexPath: IndexPath)
    
    func appInfo(didSelectRowAt indexPath: IndexPath)
    
    func appInfos() -> [DPAppInfo.DPSection]
}

public extension DPAppInfoable {
    
    func appInfo(pasteboardAt indexPath: IndexPath) {}
     
    func appInfo(didSelectRowAt indexPath: IndexPath) {}
    
    func appInfos() -> [DPAppInfo.DPSection] { [] }
}

public enum DPAppInfo {
    
    static var provider: DPAppInfoable = Provider()
    
    public static func setup(_ provider: DPAppInfoable) {
        self.provider = provider
    }
}

internal extension DPAppInfo {
    
    struct Provider: DPAppInfoable { }
}

extension DPAppInfo {
    
    public static let `default` = [
        DPSection("App信息",
              [
                DPRow("名称", UIApplication.appName),
                DPRow("version",  UIApplication.appVersion),
                DPRow("build",  UIApplication.bundleVersion),
                DPRow("bundleId",  Bundle.main.bundleIdentifier)]
        )
    ]

    public struct DPSection {
        public let title: String
        public let rows: [DPRow]

        public init(_ title: String, _ rows: [DPRow]) {
            self.title = title
            self.rows = rows
        }
    }

    public struct DPRow {
        public let title: String
        public let value: String?

        public init(_ title: String, _ value: String?) {
            self.title = title
            self.value = value
        }
    }
}
