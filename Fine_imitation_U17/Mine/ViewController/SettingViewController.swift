//
//  SettingViewController.swift
//  Fine_imitation_U17
//
//  Created by zijia on 11/13/18.
//  Copyright © 2018 zijia. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
//        navigationController?.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(dismissController))
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissController(){
        navigationController?.popViewController(animated: true)
    }

}
