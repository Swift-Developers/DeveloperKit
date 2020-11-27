//
//  ENVPluginMenuItem.swift
//  TODOEN-IELTS-MAIN
//
//  Created by 方林威 on 2020/6/5.
//
//
//import HyperionCore
//
//protocol ENVPluginMenuItemDelegate: NSObjectProtocol {
//    func currentAnimationSpeed() -> Env
//    func userInitiated(_ env: Env)
//}
//
//class ENVPluginMenuItem:  HYPPluginMenuItem {
//    
//    weak var envDelegate: ENVPluginMenuItemDelegate?
//    
//    private let buttonW: CGFloat = 50
//    
//    private lazy var stackView = UIStackView(arrangedSubviews: buttons)
//    
//    private lazy var buttons: [UIButton] = [Env.main, Env.beta].map {
//        let button = UIButton()
//        button.setTitle($0.title, for: .normal)
//        button.titleLabel?.font = .systemFont(ofSize: 14)
//        button.addTarget(self, action: #selector(envAction), for: .touchUpInside)
//        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
//        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .selected)
//        button.setBackgroundImage(UIImage(color: #colorLiteral(red: 0.8823529412, green: 0.8823529412, blue: 0.8823529412, alpha: 1), size: CGSize(buttonW, buttonW)), for: .normal)
//        button.setBackgroundImage(UIImage(color: #colorLiteral(red: 0.1921568627, green: 0.3607843137, blue: 0.9215686275, alpha: 1), size: CGSize(buttonW, buttonW)), for: .selected)
//        button.layer.cornerRadius = 25
//        button.layer.masksToBounds = true
//        button.tag = $0.rawValue
//        return button
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setup()
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        setup()
//    }
//    
//    private func setup() {
//        addSubview(stackView)
//        stackView.axis = .horizontal
//        stackView.spacing = 20
//        stackView.alignment = .center
//        stackView.distribution = .equalSpacing
//    }
//    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        let w = buttonW + buttonW + stackView.spacing
//        stackView.frame = CGRect(pluginImageView.frame.minX, titleLabel.frame.maxY + 20, w, buttonW)
//    }
//    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//        
//        buttons.forEach { $0.alpha = selected ? 0 : 1 }
//
//        let yTranslation = CATransform3DTranslate(CATransform3DIdentity, 0, -45, 0)
//        buttons.forEach { $0.layer.transform = selected ? yTranslation : CATransform3DIdentity}
//        
//        UIView.animateKeyframes(
//            withDuration: animated ? 0.4 : 0.0,
//            delay: 0.0,
//            options: [.beginFromCurrentState, .calculationModeCubic],
//            animations: {
//                self.buttons.forEach { btn in
//                    UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.33) {
//                        btn.layer.transform = selected ? CATransform3DIdentity : yTranslation
//                        btn.alpha = selected ? 1.0 : 0.0;
//                    }
//                }
//            },
//            completion: nil)
//
//        if let env = envDelegate?.currentAnimationSpeed() {
//            updateButtonSelection(env)
//        }
//    }
//    
//    @objc
//    private func envAction(_ sender: UIButton) {
//        guard let env = Env(rawValue: sender.tag) else {
//            return
//        }
//        updateButtonSelection(env)
//        envDelegate?.userInitiated(env)
//    }
//    
//    func updateButtonSelection(_ env: Env) {
//        buttons.forEach { $0.isSelected = $0.tag == env.rawValue }
//    }
//}
//
//extension Env {
//    
//    var title: String {
//        switch self {
//        case .main:
//            return "正式"
//        case .beta:
//            return "测试"
//        default:
//            return "其他"
//        }
//    }
//}
