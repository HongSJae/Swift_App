//
//  ViewController.swift
//  CMD
//
//  Created by 홍승재 on 2022/06/30.
//

import UIKit
import SnapKit
import Alamofire
import Then

class LoginVC: UIViewController {
    
    lazy var LoginBtn = { () -> UIButton in
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 20
        return button
    }()
    
    lazy var Admin = { () -> UIButton in
        let button = UIButton()
        button.backgroundColor = .lightGray
        button.setTitle("관리자", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var gotoSignupVCBtn = { () -> UIButton in
        let button = UIButton()
        button.setTitle("아이디가 없으신가요? 회원가입", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    lazy var IdBox = { () -> UIView in
        let view = UIView()
        view.backgroundColor = UIColor(named: "InputBox")
        view.layer.cornerRadius = 10
        return view
    }()
    lazy var IdTF = { () -> UITextField in
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.placeholder = "아이디"
        
        return textField
    }()
    
    
    lazy var PwBox = { () -> UIView in
        let view = UIView()
        view.backgroundColor = UIColor(named: "InputBox")
        view.layer.cornerRadius = 10
        return view
    }()
    lazy var PwTF = { () -> UITextField in
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.placeholder = "비밀번호"
        return textField
    }()
    
    lazy var Logo = { () -> UIImageView in
        let image = UIImageView()
        image.image = UIImage(named: "CMD-W")
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.setNavigationBarHidden(true, animated: true)

        self.view.addSubview(IdBox)
        self.view.addSubview(IdTF)
        self.view.addSubview(PwBox)
        self.view.addSubview(PwTF)
        self.view.addSubview(Logo)
        self.view.addSubview(LoginBtn)
        self.view.addSubview(gotoSignupVCBtn)
        self.view.addSubview(Admin)
        
        self.view.backgroundColor = UIColor(named: "BackgroundColor")

        //아이디 입력 위치 설정
        IdBox.snp.makeConstraints { make in
            make.leftMargin.rightMargin.equalTo(40)
            make.height.equalTo(54)
            make.centerX.equalToSuperview()
            make.top.equalTo(Logo.snp.bottom).offset(135)//44
        }
        IdTF.snp.makeConstraints { make in
            make.height.equalTo(26)
            make.width.equalTo(250)
            make.centerY.equalTo(IdBox)
            make.leading.equalTo(IdBox.snp.leading).inset(20)
        }
        
        //비밀번호 입력 위치 설정
        PwBox.snp.makeConstraints { make in
            make.leftMargin.rightMargin.equalTo(40)
            make.height.equalTo(54)
            make.centerX.equalToSuperview()
            make.top.equalTo(IdBox.snp.bottom).offset(46)
        }
        PwTF.snp.makeConstraints { make in
            make.height.equalTo(26)
            make.width.equalTo(250)
            make.centerY.equalTo(PwBox)
            make.leading.equalTo(PwBox.snp.leading).inset(20)
        }
        
        //로고 위치 설정
        Logo.snp.makeConstraints { make in
            make.height.equalTo(140)
            make.width.equalTo(152)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(100)
        }
        
        //로그인 버튼 위치 설정
        LoginBtn.snp.makeConstraints { make in
            make.height.equalTo(54)
            make.leftMargin.rightMargin.equalTo(40)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(132)
        }
        LoginBtn.addTarget(self, action: #selector(GotoScheduleVC), for: .touchUpInside)
        
        //회원가입 하러가기 버튼 위치 설정
        gotoSignupVCBtn.snp.makeConstraints { make in
            make.height.equalTo(17)
            make.width.equalTo(166)
            make.centerX.equalToSuperview()
            make.top.equalTo(LoginBtn.snp.bottom).offset(26)
        }
        gotoSignupVCBtn.addTarget(self, action: #selector(gotoSignupVC), for: .touchUpInside)
        
        Admin.snp.makeConstraints { make in
            make.height.equalTo(25)
            make.leftMargin.rightMargin.equalTo(80)
            make.centerX.equalToSuperview()
            make.top.equalTo(PwBox.snp.bottom).offset(50)
        }
        Admin.addTarget(self, action: #selector(GotoScheduleVC), for: .touchUpInside)
    }
    
    @objc fileprivate func GotoScheduleVC() {
        let MainTabBarControllerViewController = MainTabBarControllerViewController()
        self.navigationController?.pushViewController(MainTabBarControllerViewController, animated: true)
        
    }
    
    @objc fileprivate func gotoSignupVC() {
        let SignupVC = SignupVC()
        self.navigationController?.pushViewController(SignupVC, animated: true)
        
    }
    


}

