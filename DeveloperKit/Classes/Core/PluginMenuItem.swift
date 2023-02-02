//
//  PluginMenuItem.swift
//  DeveloperKit
//
//  Created by 方林威 on 2020/11/28.
//

import HyperionCore

open class PluginMenuItem: UIView {
    
    public weak var delegate: HYPPluginMenuItemDelegate?
    public var _isSelected: Bool = false
    
    open lazy var titleLabel: UILabel = {
        $0.numberOfLines = 2
        return $0
    }( UILabel() )
    
    open lazy var imageView = UIImageView()
    
    public var contentHeight: CGFloat {
        get { heightConstraint.constant}
        set { heightConstraint.constant = newValue }
    }
    
    private lazy var heightConstraint = heightAnchor.constraint(equalToConstant: 130)
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupLayout()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        setupLayout()
    }
    
    private func setup() {
        addSubview(titleLabel)
        addSubview(imageView)
        
        addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(pluginTapped)))
        
        setSelected(false, animated: false)
    }
    
    private func setupLayout() {
        heightConstraint.isActive = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 28).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 114).isActive = true
    }
}

extension PluginMenuItem {
    
    @objc func pluginTapped() {
        delegate?.pluginMenuItemSelected(self)
    }
}

extension PluginMenuItem {
    
    public func bind(with title: String?, image: UIImage?) {
        titleLabel.text = title
        imageView.image = image?.withRenderingMode(.alwaysTemplate)
    }
}

extension PluginMenuItem: HYPPluginMenuItemProtocol {
    
    public func setSelected(_ selected: Bool, animated: Bool) {
        _isSelected = selected
        switch selected {
        case true:
            titleLabel.textColor = UIColor.init(red: 43.0/255.0, green: 87.0/255.0, blue: 244.0/255.0, alpha: 1.0)
            titleLabel.font = .systemFont(ofSize: 14.0, weight: .semibold)
            
        case false:
            titleLabel.textColor = UIColor.init(red: 142.0/255.0, green: 142.0/255.0, blue: 147.0/255.0, alpha: 1.0)
            titleLabel.font = .systemFont(ofSize: 14.0, weight: .regular)
        }
        
        imageView.tintColor = titleLabel.textColor
    }
    
    public var isSelected: Bool { _isSelected }
}
