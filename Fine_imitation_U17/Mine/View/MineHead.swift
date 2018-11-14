//
//  MineHead.swift
//  Fine_imitation_U17
//
//  Created by zijia on 11/13/18.
//  Copyright © 2018 zijia. All rights reserved.
//

import UIKit

class MineHead: UIView {
    
    private lazy var bgView: UIImageView = {
        let bw = UIImageView()
        bw.contentMode = .scaleAspectFill
        bw.image = UIImage(named: "mine_bg_for_girl")
        return bw
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func configUI(){
        addSubview(bgView)
        bgView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
