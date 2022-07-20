//
//  StartVCViewController.swift
//  CMD
//
//  Created by 홍승재 on 2022/07/20.
//

import UIKit
import Then
import SnapKit

class StartVC: UIViewController {

    private var Logo = UIImageView().then {
        $0.image = UIImage(named: "CMD-W")
    }
    
    private var XLine = UIView()
    
    private var Btn = UIButton().then {
        $0.titleLabel?.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(named: "BackgroundColor")
        
        self.view.addSubview(XLine)
        XLine.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        self.view.addSubview(Logo)
        Logo.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.topMargin.equalTo(self.XLine.snp.bottom).offset(-200)
            $0.width.equalTo(177)
            $0.height.equalTo(163)
        }

    }
    

}
