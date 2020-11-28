//
//  ENVPluginMenuItem.swift
//  TODOEN-IELTS-MAIN
//
//  Created by 方林威 on 2020/6/5.
//
//
import HyperionCore

protocol EnvironmentPluginMenuItemDelegate: NSObjectProtocol {
    func currentAnimationSpeed() -> Env
    func userInitiated(_ env: Env)
}

class EnvironmentPluginMenuItem:  PluginMenuItem {
    
    weak var envDelegate: EnvironmentPluginMenuItemDelegate?
    
    private let buttonW: CGFloat = 50
    
    private lazy var sctollView = UIScrollView()
    
    private var contentView = UIView()
    
    private lazy var stackView = UIStackView(arrangedSubviews: buttons)
    
    private let count = Environment.config.count
    
    private lazy var buttons: [UIButton] = (1 ... count).map {
        let button = UIButton()
        button.setTitle(Environment.config.titleClosure($0), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.addTarget(self, action: #selector(envAction), for: .touchUpInside)
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
    }

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
    
    func setupLayout() {
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
        
        contentHeight = 180
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        buttons.forEach { $0.alpha = selected ? 0 : 1 }

        let yTranslation = CATransform3DTranslate(CATransform3DIdentity, 0, -45, 0)
        buttons.forEach { $0.layer.transform = selected ? yTranslation : CATransform3DIdentity}
        
        UIView.animateKeyframes(
            withDuration: animated ? 0.4 : 0.0,
            delay: 0.0,
            options: [.beginFromCurrentState, .calculationModeCubic],
            animations: {
                self.buttons.forEach { btn in
                    UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.33) {
                        btn.layer.transform = selected ? CATransform3DIdentity : yTranslation
                        btn.alpha = selected ? 1.0 : 0.0;
                    }
                }
            },
            completion: nil)

        if let env = envDelegate?.currentAnimationSpeed() {
            updateButtonSelection(env)
        }
    }
    
    @objc
    private func envAction(_ sender: UIButton) {
        updateButtonSelection(sender.tag)
        envDelegate?.userInitiated(sender.tag)
    }
    
    func updateButtonSelection(_ env: Env) {
        buttons.forEach { $0.isSelected = $0.tag == env }
    }
}


extension UIImage {
    
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
