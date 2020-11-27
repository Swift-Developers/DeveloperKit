import HyperionCore

class EnvironmentPlugin: NSObject, HYPPlugin {
    
    static func createPluginModule(_ pluginExtension: HYPPluginExtensionProtocol) -> HYPPluginModuleProtocol {
        return EnvironmentPluginModule(with: pluginExtension)
    }
    
    static func pluginVersion() -> String {
        Bundle(for: BundleToken.self).object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String ?? ""
    }
}
