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
        return Environment.config.count
    }
    
    func userInitiated(_ env: Env) {
        guard shouldHideDrawerOnSelection() else { return }
        HyperionManager.sharedInstance()?.togglePluginDrawer()
        Environment.config.switchClosure(env)
    }
}

public typealias Env = Int

public enum Environment {
    
    static var config: Config = .default()
    
    public static func config(_ config: Config) {
        self.config = config
    }
    
    public struct Config {
        var count: Env = 0
        var titleClosure: (Env) -> String = { index in "\(index)"}
        var switchClosure: (Env) -> Void = { index in print(index) }
        
        public init(count: Env,
                    _ titleClosure: @escaping (Env) -> String,
                    _ switchClosure: @escaping (Env) -> Void) {
            self.count = count
            self.titleClosure = titleClosure
            self.switchClosure = switchClosure
        }
        
        static func `default`() -> Config {
            self.init(count: 1) {_ in
                "默认"
            } _: { _ in
                print("默认")
            }

        }
    }
}
