//
//  ViewController.swift
//  SnapKitView
//
//  Created by Yidi Zhao on 2019/12/16.
//  Copyright © 2019 Yidi Zhao. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var yellowBox: UIView = {
        let box = UIView()
        box.backgroundColor = .yellow
        box.layer.cornerRadius = 40
        box.layer.masksToBounds = true
        box.layer.borderWidth = 2
        box.layer.borderColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        box.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapBox))
        box.addGestureRecognizer(tapGesture)
        return box
    }()
    
    lazy var oringeBox: UIView = {
        let box = UIView()
        box.backgroundColor = .orange
        box.layer.cornerRadius = 20
        box.layer.masksToBounds = true
        return box
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.addSubview(yellowBox)
        yellowBox.addSubview(oringeBox)
        snapKitAutoLayout()
        oringeBoxAutoLayout()
    }
    
    @objc private func tapBox() {
        print("tap the box!")
    }
    
    private func snapKitAutoLayout() {
        yellowBox.snp.makeConstraints{(make) in
            make.width.equalTo(80)
            make.height.equalTo(80)
            make.center.equalTo(view.snp.center)
            
        }
    }
    
    private func oringeBoxAutoLayout() {
        oringeBox.snp.makeConstraints{(make) in
            make.width.equalTo(yellowBox.snp.width).multipliedBy(0.5)
            make.height.equalTo(oringeBox.snp.width)
            make.center.equalTo(yellowBox.snp.center)
        }
    }


}

