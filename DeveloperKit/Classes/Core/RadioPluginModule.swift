//
//  RadioPluginModule.swift
//  DeveloperKit
//
//  Created by 方林威 on 2023/2/2.
//

import HyperionCore

public protocol RadioPluginModuleDataSource: NSObjectProtocol {
    
    func numberOfItems() -> Int
    func radio(_ radio: RadioPluginModule, titleAt index: Int) -> String?
    func radio(_ radio: RadioPluginModule, selectedAt index: Int) -> Bool
    func radio(_ radio: RadioPluginModule, didSelectedAt index: Int)
}

open class RadioPluginModule: HYPPluginModule, HYPPluginMenuItemDelegate {
    
    public weak var dataSource: RadioPluginModuleDataSource?
    
    public var title: String?
    
    public var image: UIImage?
    
    private lazy var pluginItem: RadioPluginMenuItem = {
        $0.delegate = self
        $0.dataSource = self
        return $0
    }( RadioPluginMenuItem() )
    
    private var isSelected = false
    
    open override var pluginMenuItem: (UIView & HYPPluginMenuItemProtocol)? {
        pluginItem.bind(with: title, image: image)
        return pluginItem
    }
    
    open func pluginMenuItemSelected(_ pluginView: (UIView & HYPPluginMenuItemProtocol)!) {
        isSelected.toggle()
        pluginItem.setSelected(isSelected, animated: true)
    }
}

extension RadioPluginModule: RadioPluginMenuItemDataSource  {
    
    public func numberOfItems() -> Int {
        dataSource?.numberOfItems() ?? 0
    }
    
    public func radio(_ radio: RadioPluginMenuItem, titleAt index: Int) -> String? {
        dataSource?.radio(self, titleAt: index)
    }
    
    public func radio(_ radio: RadioPluginMenuItem, selectedAt index: Int) -> Bool {
        dataSource?.radio(self, selectedAt: index) ?? false
    }
    
    public func radio(_ radio: RadioPluginMenuItem, didSelectedAt index: Int) {
        guard shouldHideDrawerOnSelection() else { return }
        HyperionManager.sharedInstance()?.togglePluginDrawer()
        dataSource?.radio(self, didSelectedAt: index)
    }
}
