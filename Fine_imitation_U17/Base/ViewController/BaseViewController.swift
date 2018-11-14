//
//  BaseViewController.swift
//  Fine_imitation_U17
//
//  Created by zijia on 11/13/18.
//  Copyright © 2018 zijia. All rights reserved.
//

import UIKit
import SnapKit
import Then
import Reusable
import Kingfisher



class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configNavigationBar()
    }
    
    func configNavigationBar() {
        guard let navi = navigationController else { return }
        if navi.visibleViewController == self {
//            navi.barStyle(.theme)
//            navi.disablePopGesture = false
            navi.setNavigationBarHidden(false, animated: true)
            if navi.viewControllers.count > 1 {
                navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "nav_back_white"), style: .plain,
                                                                   target: self,
                                                                   action: #selector(pressBack))
                
            }
        }
    }
    
    @objc func pressBack() {
        navigationController?.popViewController(animated: true)
    }
    
    func configUI(){}
}

extension BaseViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}
