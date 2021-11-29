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
    
    func currentAnimationSpeed() -> DPEnv {
        return DPEnvironment.config.selected()
    }
    
    func userInitiated(_ env: DPEnv) {
        guard shouldHideDrawerOnSelection() else { return }
        HyperionManager.sharedInstance()?.togglePluginDrawer()
        DPEnvironment.config.switch(env)
    }
}

public typealias DPEnv = Int

public enum DPEnvironment {
    
    public typealias EnvConfig = () -> DPEnv
    public typealias TitleConfig = (DPEnv) -> String
    public typealias SwitchConfig = (DPEnv) -> Void
    
    static var config: DPConfig = DPConfig()
    
    public static func config(envs: @escaping EnvConfig,
                              selected: @escaping EnvConfig,
                              title: @escaping TitleConfig,
                              `switch`: @escaping SwitchConfig) {
        self.config = DPConfig(envs, selected, title, `switch`)
    }
    
    public struct DPConfig {
        
        let envs: EnvConfig
        let selected: EnvConfig
        let title: TitleConfig
        let `switch`: SwitchConfig
        
        init(_ envs: @escaping EnvConfig = { 1 },
             _ selected: @escaping EnvConfig = { 1 },
             _ title: @escaping TitleConfig = { index in "\(index)"},
             _ `switch`: @escaping SwitchConfig = { index in print(index) }) {

            self.envs = envs
            self.selected = selected
            self.title = title
            self.`switch` = `switch`
        }
    }
}
