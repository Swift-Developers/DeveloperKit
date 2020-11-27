//
//  AppInfoController.swift
//  TODOEN-IELTS-MAIN
//
//  Created by 方林威 on 2020/6/5.
//

//import UIKit
//import DeviceKit
////import Alamofire
//
//class AppInfoController: UITableViewController {
//
//    private static var isPresent = false
//
//    private let groups: [Group] = [
//        Group("App信息",
//              [
//                Row("名称", UIApplication.appName),
//                Row("version",  UIApplication.appVersion),
//                Row("build",  UIApplication.bundleVersion),
//                Row("bundleId",  Bundle.main.bundleIdentifier),
//                Row("difa", UIApplication.IDFA)]),
//
//        Group("用户信息",
//              [
//                Row("userId", Account.info?.id.string),
//                Row("token",  Account.info?.token),
//                Row("手机号",  Account.info?.phone)
//        ]),
//
//        Group("设备信息",
//              [
//                Row("网络状态",  NetworkReachabilityManager.default?.status.title ?? ""),
//                Row("设备名称",  Device.current.description),
//                Row("系统版本",  UIDevice.current.systemVersion),
//                Row("标识号",   UIDevice.identifier)
//        ]),
//    ]
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setup()
//    }
//
//    private func setup() {
//        title = "App信息"
//        view.backgroundColor = #colorLiteral(red: 0.4509803922, green: 0.4509803922, blue: 0.4509803922, alpha: 1)
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.register(cellWithClass: AppInfoCell.self)
//
//        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "完成", style: .done, target: self, action: #selector(doneAction))
//    }
//
//    static func show() {
//        guard !isPresent else { return }
//
//        let controller = AppInfoController(style: .plain)
//        UIViewController.top?.present(UINavigationController(rootViewController: controller), animated: true)
//        isPresent = true
//    }
//
//    deinit {
//        AppInfoController.isPresent = false
//    }
//}
//
//extension AppInfoController {
//
//    @objc
//    private func doneAction() {
//        dismiss(animated: true)
//    }
//}
//
//extension AppInfoController {
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return groups.count
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return groups[section].rows.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withClass: AppInfoCell.self,
//                                                 for: indexPath)
//        let row = groups[indexPath.section].rows[indexPath.row]
//        cell.set(title: row.title, desc: row.value)
//        return cell
//    }
//
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return groups[section].title
//    }
//
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//
//    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        let row = groups[indexPath.section].rows[indexPath.row]
//        let action = UITableViewRowAction(style: .normal, title: "复制") { (action, _) in
//            UIPasteboard.general.string = row.value
//            Toast.show(hud: "\(row.title) 已复制")
//        }
//        action.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
//        return [action]
//    }
//}
//
//extension AppInfoController {
//
//    struct Group {
//        let title: String
//        let rows: [Row]
//
//        init(_ title: String, _ rows: [Row]) {
//            self.title = title
//            self.rows = rows
//        }
//    }
//
//    struct Row {
//        let title: String
//        let value: String?
//
//        init(_ title: String, _ value: String?) {
//            self.title = title
//            self.value = value
//        }
//    }
//}
//
//fileprivate class AppInfoCell: UITableViewCell {
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
//        setup()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func setup() {
//        backgroundColor = #colorLiteral(red: 0.4509803922, green: 0.4509803922, blue: 0.4509803922, alpha: 1)
//        textLabel?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        detailTextLabel?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        selectionStyle = .none
//        detailTextLabel?.numberOfLines = 0
//
//        if #available(iOS 13.0, *) {
//            textLabel?.font = .monospacedSystemFont(ofSize: 15, weight: .regular)
//            detailTextLabel?.font = .monospacedSystemFont(ofSize: 13, weight: .regular)
//        } else {
//            textLabel?.font = .systemFont(ofSize: 15)
//            detailTextLabel?.font = .systemFont(ofSize: 13)
//        }
//    }
//
//    func set(title: String, desc: String?) {
//        textLabel?.text = title
//        detailTextLabel?.text = desc
//    }
//}
//
//extension NetworkReachabilityManager.NetworkReachabilityStatus {
//
//    var title: String {
//        switch self {
//        case .notReachable:                 return "无效网络"
//        case .reachable(.ethernetOrWiFi):   return "WIFI"
//        case .reachable(.cellular):         return "蜂窝网络"
//        case .unknown:                      return "未知"
//        }
//    }
//}
