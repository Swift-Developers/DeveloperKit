//
//  DeveloperPlugin.swift
//  DeveloperKit_Example
//
//  Created by 方林威 on 2023/2/2.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import HyperionCore
import DeveloperKit

class EnvironmentPlugin: NSObject, HYPPlugin {
    
    private static let dataSource = DataSource()
    
    static func createPluginModule(_ pluginExtension: HYPPluginExtensionProtocol) -> HYPPluginModuleProtocol {
        let module = RadioPluginModule(with: pluginExtension)
        module.title = "环境切换"
        module.image = UIImage(named: "developer_env_icon")
        module.dataSource = dataSource
        return module
    }
    
    static func pluginVersion() -> String {
        "1.0.1"
    }
    
    private class DataSource: NSObject, RadioPluginModuleDataSource {
        
        func numberOfItems() -> Int {
            3
        }
        
        func radio(_ radio: DeveloperKit.RadioPluginModule, titleAt index: Int) -> String? {
            "环境\(index)"
        }
        
        func radio(_ radio: DeveloperKit.RadioPluginModule, selectedAt index: Int) -> Bool {
            false
        }
        
        func radio(_ radio: DeveloperKit.RadioPluginModule, didSelectedAt index: Int) {
            print("切换到环境\(index)")
        }
        
        
        
    }
}

