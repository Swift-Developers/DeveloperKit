//
//  RadioPluginMenuItem.swift
//  DeveloperKit
//
//  Created by 方林威 on 2023/2/2.
//

import HyperionCore
import UIKit

public protocol RadioPluginMenuItemDataSource: NSObjectProtocol {
    func numberOfItems() -> Int
    func radio(_ radio: RadioPluginMenuItem, titleAt index: Int) -> String?
    func radio(_ radio: RadioPluginMenuItem, selectedAt index: Int) -> Bool
    func radio(_ radio: RadioPluginMenuItem, didSelectedAt index: Int)
}

public class RadioPluginMenuItem:  PluginMenuItem {
    
    weak var dataSource: RadioPluginMenuItemDataSource?
    
    private let buttonW: CGFloat = 50
    
    private lazy var sctollView = UIScrollView()
    
    private var contentView = UIView()
    
    private lazy var stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        setupLayout()
    }
    
    private func setup() {
        addSubview(sctollView)
        sctollView.addSubview(contentView)
        contentView.addSubview(stackView)
        
        sctollView.showsVerticalScrollIndicator = false
        sctollView.showsHorizontalScrollIndicator = false
        sctollView.contentInset = .zero
        
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .fill
    }
    
    public func setupLayout() {
     
        sctollView.translatesAutoresizingMaskIntoConstraints = false
        sctollView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        sctollView.leftAnchor.constraint(equalTo: imageView.leftAnchor, constant: 10).isActive = true
        sctollView.rightAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true
        sctollView.heightAnchor.constraint(equalToConstant: buttonW).isActive = true

        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: sctollView.contentLayoutGuide.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: sctollView.contentLayoutGuide.bottomAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: sctollView.contentLayoutGuide.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: sctollView.contentLayoutGuide.rightAnchor).isActive = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        
        contentHeight = 130
    }
    
    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        prepare()
        
        stackView.arrangedSubviews.forEach { $0.alpha = selected ? 0 : 1 }

        let yTranslation = CATransform3DTranslate(CATransform3DIdentity, 0, -45, 0)
        stackView.arrangedSubviews.forEach { $0.layer.transform = selected ? yTranslation : CATransform3DIdentity}
        
        UIView.animateKeyframes(
            withDuration: animated ? 0.4 : 0.0,
            delay: 0.0,
            options: [.beginFromCurrentState, .calculationModeCubic],
            animations: {
                self.stackView.arrangedSubviews.forEach { btn in
                    UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.33) {
                        btn.layer.transform = selected ? CATransform3DIdentity : yTranslation
                        btn.alpha = selected ? 1.0 : 0.0;
                    }
                }
            },
            completion: nil)
    }
    
    @objc
    private func radioAction(_ sender: UIButton) {
        dataSource?.radio(self, didSelectedAt: sender.tag)
        reloadButtons()
    }
    
    /// 绘制按钮
    private func prepare() {
        guard let count = dataSource?.numberOfItems() else {
            return
        }
        stackView.arrangedSubviews.forEach { stackView.removeArrangedSubview($0) }
        stackView.subviews.forEach { $0.removeFromSuperview() }
        
        (0 ... (count - Int(1))).map {
            let button = UIButton()
            button.setTitle(dataSource?.radio(self, titleAt: $0), for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 14)
            button.addTarget(self, action: #selector(radioAction), for: .touchUpInside)
            button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
            button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .selected)
            button.setBackgroundImage(UIImage(color: #colorLiteral(red: 0.8823529412, green: 0.8823529412, blue: 0.8823529412, alpha: 1), size: CGSize(width: buttonW, height: buttonW)), for: .normal)
            button.setBackgroundImage(UIImage(color: #colorLiteral(red: 0.1921568627, green: 0.3607843137, blue: 0.9215686275, alpha: 1), size: CGSize(width: buttonW, height: buttonW)), for: .selected)
            button.layer.cornerRadius = 25
            button.layer.masksToBounds = true
            button.tag = $0
            button.translatesAutoresizingMaskIntoConstraints = false
            button.widthAnchor.constraint(equalToConstant: buttonW).isActive = true
            button.heightAnchor.constraint(equalToConstant: buttonW).isActive = true
            return button
        }.forEach {
            stackView.addArrangedSubview($0)
        }
        reloadButtons()
    }
    
    private func reloadButtons() {
        guard let dataSource = dataSource else { return }
        stackView.arrangedSubviews.compactMap { $0 as? UIButton }.forEach {
            $0.isSelected = dataSource.radio(self, selectedAt: $0.tag)
        }
    }
}

private extension UIImage {
    
    convenience init(color: UIColor, size: CGSize) {
        UIGraphicsBeginImageContextWithOptions(size, false, 1)

        defer {
            UIGraphicsEndImageContext()
        }

        color.setFill()
        UIRectFill(CGRect(origin: .zero, size: size))

        guard let aCgImage = UIGraphicsGetImageFromCurrentImageContext()?.cgImage else {
            self.init()
            return
        }

        self.init(cgImage: aCgImage)
    }
}
