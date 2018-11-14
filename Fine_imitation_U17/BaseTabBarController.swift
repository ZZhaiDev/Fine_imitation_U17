//
//  BaseTabBarController.swift
//  Fine_imitation_U17
//
//  Created by zijia on 11/13/18.
//  Copyright © 2018 zijia. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.isTranslucent = false
        view.backgroundColor = .white
        
        let mineVC = MineViewController()
        addChildViewController(mineVC,
                               title: "我的",
                               image: UIImage(named: "tab_mine"),
                               selectedImage: UIImage(named: "tab_mine_S"))
        
        let viewController = UIViewController()
        addChildViewController(viewController,
                               title: "首页",
                               image: UIImage(named: "tab_home"),
                               selectedImage: UIImage(named: "tab_home_S"))
        
        let viewController1 = UIViewController()
        addChildViewController(viewController1,
                               title: "分类",
                               image: UIImage(named: "tab_class"),
                               selectedImage: UIImage(named: "tab_class_S"))
        
        let viewController2 = UIViewController()
        addChildViewController(viewController2,
                               title: "书架",
                               image: UIImage(named: "tab_book"),
                               selectedImage: UIImage(named: "tab_book_S"))
        
        
    }
    
    func addChildViewController(_ childController: UIViewController, title:String?, image:UIImage? ,selectedImage:UIImage?) {
        
        childController.title = title
        childController.tabBarItem = UITabBarItem(title: nil,
                                                  image: image?.withRenderingMode(.alwaysOriginal),
                                                  selectedImage: selectedImage?.withRenderingMode(.alwaysOriginal))
        
        childController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        addChild(UINavigationController(rootViewController: childController))
    }

}
