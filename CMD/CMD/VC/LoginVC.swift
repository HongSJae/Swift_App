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
    
    private var LoginBtn = UIButton().then {
        $0.backgroundColor = .white
        $0.setTitle("로그인", for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.layer.cornerRadius = 20
    }
    
    private var Admin = UIButton().then {
        $0.backgroundColor = .lightGray
        $0.setTitle("관리자", for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.layer.cornerRadius = 10
    }
    
    private var gotoSignupVCBtn = UIButton().then {
        $0.setTitle("아이디가 없으신가요? 회원가입", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 12)
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
    private var PwTF = UITextField().then {
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.placeholder = "비밀번호"
    }
    
    private var Logo = UIImageView().then {
        $0.image = UIImage(named: "CMD-W")
    }
    
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
        Login()
        
    }
    
    @objc fileprivate func gotoSignupVC() {
        let SignupVC = SignupVC()
        self.navigationController?.pushViewController(SignupVC, animated: true)
        
    }
    
    func Login() {
        let url = "http://54.180.120.242:8080/signin"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 10
        
        // POST 로 보낼 정보
        let params = ["userId":"Reswo", "password":"a141412424"]
        
        // httpBody 에 parameters 추가
        do {
            try request.httpBody = JSONSerialization.data(withJSONObject: params, options: [])
        } catch {
            print("http Body Error")
        }
        AF.request(request).responseString { (response) in
            switch response.result {
            case .success:
                print("POST 성공")
                print(response)
            case .failure(let error):
                print("🚫 Alamofire Request Error\nCode:\(error._code), Message: \(error.errorDescription!)")   
            }
        }
    }
}

