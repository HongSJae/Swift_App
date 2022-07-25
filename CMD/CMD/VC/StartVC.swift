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
        $0.setTitle("여기를 눌러서 시작하세요", for: .normal)
        $0.titleLabel?.font = UIFont(name: "NotoSansKR-Medium", size: 23)
        $0.setTitleColor(UIColor.white, for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(named: "BackgroundColor")
        
        Logo.alpha = 0
        
        UIView.animate(withDuration: 1.0, animations: ({
            self.Logo.alpha  = 1;
        }))
        
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
        Logo.alpha = 0

        self.view.addSubview(Btn)
        Btn.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottomMargin.equalTo(-50)
            $0.width.equalTo(300)
            $0.height.equalTo(100)
        }
        Btn.addTarget(self, action: #selector(BtnClicked), for: .touchUpInside)
        Btn.alpha = 0
        
        UIView.animate(withDuration: 2.0, animations: ({
            self.Logo.alpha  = 1;
            self.Btn.alpha = 1;
        }))
    }

    @objc fileprivate func BtnClicked() {
        let LoginVC = LoginVC()
        self.navigationController?.pushViewController(LoginVC, animated: true)
    }
}

