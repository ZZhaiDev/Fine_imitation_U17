//
//  MineViewController.swift
//  Fine_imitation_U17
//
//  Created by zijia on 11/13/18.
//  Copyright © 2018 zijia. All rights reserved.
//

import UIKit
import SnapKit

extension UIColor {
    class var background: UIColor {
//        return UIColor(r: 242, g: 242, b: 242)
        return UIColor(displayP3Red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0)
    }
    
    class var theme: UIColor {
        return UIColor(displayP3Red: 29/255, green: 221/255, blue: 43/255, alpha: 1.0)
    }
}

extension ConstraintView {
    
    var usnp: ConstraintBasicAttributesDSL {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.snp
        } else {
            return self.snp
        }
    }
}

class MineViewController: BaseViewController {
    
    private lazy var myArray: Array = {
        return [[["icon":"mine_vip", "title": "我的VIP"],
                 ["icon":"mine_coin", "title": "充值妖气币"]],
                
                [["icon":"mine_accout", "title": "消费记录"],
                 ["icon":"mine_subscript", "title": "我的订阅"],
                 ["icon":"mine_seal", "title": "我的封印图"]],
                
                [["icon":"mine_message", "title": "我的消息/优惠券"],
                 ["icon":"mine_cashew", "title": "妖果商城"],
                 ["icon":"mine_freed", "title": "在线阅读免流量"]],
                
                [["icon":"mine_feedBack", "title": "帮助中心"],
                 ["icon":"mine_mail", "title": "我要反馈"],
                 ["icon":"mine_judge", "title": "给我们评分"],
                 ["icon":"mine_author", "title": "成为作者"],
                 ["icon":"mine_setting", "title": "设置"]]]
    }()
    
    private lazy var head: MineHead = {
       return MineHead(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200))
    }()
    
    private lazy var navigationBarY: CGFloat = {
       return navigationController?.navigationBar.frame.maxY ?? 0
        }()
    
    let cellId = "cellId"
    lazy var tableView: UITableView = {
       let tv = UITableView(frame: .zero, style: .grouped)
        tv.backgroundColor = UIColor.background
        tv.delegate = self
        tv.dataSource = self
        tv.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
//        edgesForExtendedLayout = .top
    }
    
    override func configUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            //            make.edges.equalTo(self.view.usnp.edges).priority(.low)
            //            make.top.equalToSuperview()
            make.edges.equalToSuperview()
        }
        
//        tableView.parallaxHeader.view = head
        tableView.parallaxHeader.view = head
        tableView.parallaxHeader.height = 200
        tableView.parallaxHeader.minimumHeight = navigationBarY
        tableView.parallaxHeader.mode = .fill
        
        
    }
}

extension MineViewController: UITableViewDelegate, UITableViewDataSource{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return myArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionArray = myArray[section]
        return sectionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .default
        let sectionArray = myArray[indexPath.section]
        let dict: [String: String] = sectionArray[indexPath.row]
        cell.imageView?.image = UIImage(named: dict["icon"] ?? "")
        cell.textLabel?.text = dict["title"]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let sectionArray = indexPath.section
        let index = indexPath.row
        if Int(index) == 4{
            navigationController?.pushViewController(SettingViewController(), animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return CGFloat.leastNormalMagnitude
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    
}
