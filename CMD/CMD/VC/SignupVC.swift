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

class SignupVC: UIViewController {
    
    private var SignupBtn = UIButton().then {
        $0.backgroundColor = .white
        $0.setTitle("회원가입", for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.layer.cornerRadius = 20
    }
    
    private var gotoLoginVCBtn = UIButton().then {
        $0.setTitle("계정이 있으신가요? 로그인", for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        $0.setTitleColor(UIColor.white, for: .normal)
    }
    
    private var IdBox = UIView().then {
        $0.backgroundColor = UIColor(named: "InputBox")
        $0.layer.cornerRadius = 10
    }
    private var IdTF = UITextField().then {
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.placeholder = "아이디"
    }
    
    
    private var PwBox = UIView().then {
        $0.backgroundColor = UIColor(named: "InputBox")
        $0.layer.cornerRadius = 10
    }
    var PwTF = UITextField().then {
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.placeholder = "비밀번호"
    }
    
    private var PwCBox = UIView().then {
        $0.backgroundColor = UIColor(named: "InputBox")
        $0.layer.cornerRadius = 10
    }
    private var PwCTF = UITextField().then {
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.placeholder = "비밀번호 확인"
    }
    
    private var CodeCheck = UIView().then {
        $0.backgroundColor = UIColor(named: "InputBox")
        $0.layer.cornerRadius = 10
    }
    private var CodeCheckTF = UITextField().then {
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.placeholder = "가입코드"
    }
    
    private var Logo = UIImageView().then {
        $0.image = UIImage(named: "CMD-W")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = true //네비게이션바 숨기기
        
        self.view.backgroundColor = UIColor(named: "BackgroundColor")
        
        self.view.addSubview(IdBox)
        self.view.addSubview(IdTF)
        self.view.addSubview(PwBox)
        self.view.addSubview(PwTF)
        self.view.addSubview(PwCBox)
        self.view.addSubview(PwCTF)
        self.view.addSubview(CodeCheck)
        self.view.addSubview(CodeCheckTF)
        self.view.addSubview(Logo)
        self.view.addSubview(SignupBtn)
        self.view.addSubview(gotoLoginVCBtn)
        
        //로고 위치 설정
        Logo.snp.makeConstraints { make in
            make.height.equalTo(140)
            make.width.equalTo(152)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(100)
        }
        
        //아이디 입력 위치 설정
        IdBox.snp.makeConstraints { make in
            make.leftMargin.rightMargin.equalTo(40)
            make.height.equalTo(54)
            make.centerX.equalToSuperview()
            make.top.equalTo(Logo.snp.bottom).offset(52)
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
            make.top.equalTo(IdBox.snp.bottom).offset(31)
        }
        PwTF.snp.makeConstraints { make in
            make.height.equalTo(26)
            make.width.equalTo(250)
            make.centerY.equalTo(PwBox)
            make.leading.equalTo(PwBox.snp.leading).inset(20)
        }
        
        //비밀번호 확인 입력 위치 설정
        PwCBox.snp.makeConstraints { make in
            make.leftMargin.rightMargin.equalTo(40)
            make.height.equalTo(54)
            make.centerX.equalToSuperview()
            make.top.equalTo(PwBox.snp.bottom).offset(31)
        }
        PwCTF.snp.makeConstraints { make in
            make.height.equalTo(26)
            make.width.equalTo(250)
            make.centerY.equalTo(PwCBox)
            make.leading.equalTo(PwCBox.snp.leading).inset(20)
        }
        
        //가입코드 입력 위치 설정
        CodeCheck.snp.makeConstraints { make in
            make.leftMargin.rightMargin.equalTo(40)
            make.height.equalTo(54)
            make.centerX.equalToSuperview()
            make.top.equalTo(PwCBox.snp.bottom).offset(31)
        }
        CodeCheckTF.snp.makeConstraints { make in
            make.height.equalTo(26)
            make.width.equalTo(250)
            make.centerY.equalTo(CodeCheck)
            make.leading.equalTo(CodeCheck.snp.leading).inset(20)
        }

        //회원가입 버튼 위치 설정
        SignupBtn.snp.makeConstraints { make in
            make.height.equalTo(54)
            make.leftMargin.rightMargin.equalTo(40)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(120)
        }
        SignupBtn.addTarget(self, action: #selector(Signup), for: .touchUpInside)//Action 추가
        
        //로그인 하러가기 버튼 위치 설정
        gotoLoginVCBtn.snp.makeConstraints { make in
            make.height.equalTo(17)
            make.width.equalTo(166)
            make.centerX.equalToSuperview()
            make.top.equalTo(SignupBtn.snp.bottom).offset(26)
        }
        gotoLoginVCBtn.addTarget(self, action: #selector(GotoLoginVCBtn), for: .touchUpInside)//Action 추가
    }
    @objc fileprivate func Signup() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc fileprivate func GotoLoginVCBtn() {
        self.navigationController?.popViewController(animated: true)
    }
    
    

}

