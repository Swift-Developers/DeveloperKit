//
//  PluginClickModule.swift
//  Zunion
//
//  Created by 方林威 on 2021/10/22.
//

import HyperionCore
import UIKit

open class PluginModule: HYPPluginModule {
    
    open var title: String?
    
    open var image: UIImage?

    open override func pluginMenuItemTitle() -> String {
        title ?? ""
    }
    
    open override func pluginMenuItemImage() -> UIImage {
        image ?? UIImage()
    }
}

open class ClickPluginModule: PluginModule, HYPPluginMenuItemDelegate {
    
    var action: (() -> Void)?
    
    open func pluginMenuItemSelected(_ pluginView: (UIView & HYPPluginMenuItemProtocol)!) {
        guard shouldHideDrawerOnSelection() else { return }
        HyperionManager.sharedInstance()?.togglePluginDrawer()
        action?()
    }
    
    public func click(_ action: @escaping () -> Void) {
        self.action = action
    }
}

open class TogglePluginModule: PluginModule, HYPPluginMenuItemDelegate {
    
    open var isSelected = false {
        didSet {
            pluginMenuItem?.setSelected(isSelected, animated: true)
        }
    }
    
    var action: ((Bool) -> Void)?
    
    open func pluginMenuItemSelected(_ pluginView: (UIView & HYPPluginMenuItemProtocol)!) {
        isSelected.toggle()
        action?(isSelected)
    }
    
    public func click(_ action: @escaping ((Bool) -> Void)) {
        self.action = action
    }
}
