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

    //MARK: - 뷰 생성
    
    //로고
    private var Logo = UIImageView().then {
        $0.image = UIImage(named: "CMD-W")
        $0.alpha = 0
    }
    
    //중앙선
    private var XLine = UIView()
    
    //시작 버튼
    private var Btn = UIButton().then {
        $0.setTitle("여기를 눌러서 시작하세요", for: .normal)
        $0.titleLabel?.font = UIFont(name: "NotoSansKR-Medium", size: 23)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.alpha = 0
    }
    
    //MARK: - 뷰 생성 시
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(named: "BackgroundColor")
        
        //뷰 선언
        [XLine, Logo, Btn].forEach({view.addSubview($0)})
        
        animation()
        layout()
        setButton()
    }
    
    //MARK: - 버튼 액션 설정
    
    @objc fileprivate func BtnClicked() {
        let LoginVC = LoginVC()
        self.navigationController?.pushViewController(LoginVC, animated: true)
    }
    
    //MARK: - 뷰의 레이어 설정 함수
    func layout() {
        
        //중앙축 레이아웃
        XLine.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        //로고 레이아웃
        Logo.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.topMargin.equalTo(self.XLine.snp.bottom).offset(-200)
            $0.width.equalTo(177)
            $0.height.equalTo(163)
        }

        //시작 버튼 레이아웃
        Btn.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottomMargin.equalTo(-50)
            $0.width.equalTo(300)
            $0.height.equalTo(100)
        }
    }
    
    //MARK: - 애니메이션 설정 함수
    
    func animation() {
        UIView.animate(withDuration: 2.0, animations: ({
            self.Logo.alpha  = 1
            self.Btn.alpha = 1
        }))
    }
    
    //MARK: - 버튼 액션 실행 함수
    
    func setButton() {
        
        //시작 버튼
        Btn.addTarget(self, action: #selector(BtnClicked), for: .touchUpInside)
    }
}

