//
//  ENVPluginModule.swift
//  TODOEN-IELTS-MAIN
//
//  Created by 方林威 on 2020/6/5.
//
//
import HyperionCore

class EnvironmentPluginModule: HYPPluginModule, HYPPluginMenuItemDelegate {
    
    private lazy var pluginItem: EnvironmentPluginMenuItem = {
        $0.delegate = self
        $0.envDelegate = self
        $0.bind(with: "环境切换", image: .resources(for: "developer_env_icon"))
        return $0
    }( EnvironmentPluginMenuItem() )
    
    private var isSelected = false
    
    override var pluginMenuItem: (UIView & HYPPluginMenuItemProtocol)? {
        get { pluginItem }
    }
    
    func pluginMenuItemSelected(_ pluginView: (UIView & HYPPluginMenuItemProtocol)!) {
        isSelected.toggle()
        pluginItem.setSelected(isSelected, animated: true)
    }
}


extension EnvironmentPluginModule: EnvironmentPluginMenuItemDelegate  {
    
    func currentAnimationSpeed() -> Env {
        return Environment.config.envConfig()
    }
    
    func userInitiated(_ env: Env) {
        guard shouldHideDrawerOnSelection() else { return }
        HyperionManager.sharedInstance()?.togglePluginDrawer()
        Environment.config.switchConfig(env)
    }
}

public typealias Env = Int

public enum Environment {
    
    public typealias EnvConfig = () -> Env
    public typealias TitleConfig = (Env) -> String
    public typealias SwitchConfig = (Env) -> Void
    
    static var config: Config = Config()
    
    public static func config(envConfig: @escaping EnvConfig,
                              titleConfig: @escaping TitleConfig,
                              switchConfig: @escaping SwitchConfig) {
        self.config = Config(envConfig, titleConfig, switchConfig)
    }
    
    public struct Config {
        
        let envConfig: EnvConfig
        let titleConfig: TitleConfig
        let switchConfig: SwitchConfig
        
        init(_ envConfig: @escaping EnvConfig = { 1 },
             _ titleConfig: @escaping TitleConfig = { index in "\(index)"},
             _ switchConfig: @escaping SwitchConfig = { index in print(index) }) {
            
            self.envConfig = envConfig
            self.titleConfig = titleConfig
            self.switchConfig = switchConfig
        }
    }
}
