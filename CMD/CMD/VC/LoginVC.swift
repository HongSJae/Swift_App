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

var TokenToken: String = ""
var ID: String = ""
var PW: String = ""

class LoginVC: UIViewController {
    
    private var LoginBtn = UIButton().then {
        $0.backgroundColor = .white
        $0.setTitle("로그인", for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        $0.setTitleColor(UIColor.black, for: .normal)
//        $0.layer.cornerRadius = 20
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
//        $0.layer.cornerRadius = 10
    }
    private var IdTF = UITextField().then {
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.placeholder = "아이디"
    }
    
    
    private var PwBox = UIView().then {
        $0.backgroundColor = UIColor(named: "InputBox")
//        $0.layer.cornerRadius = 10
    }
    private var PwTF = UITextField().then {
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.placeholder = "비밀번호"
        $0.isSecureTextEntry = true
    }
    
    private var Logo = UIImageView().then {
        $0.image = UIImage(named: "CMD-W")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
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
            make.height.equalTo(self.view.safeAreaLayoutGuide).dividedBy(15)
            make.centerX.equalToSuperview()
            make.top.equalTo(Logo.snp.bottom).offset(70)
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
            make.height.equalTo(self.view.safeAreaLayoutGuide).dividedBy(15)
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
            make.height.equalTo(92)
            make.width.equalTo(100)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(100)
        }
        
        //로그인 버튼 위치 설정
        LoginBtn.snp.makeConstraints { make in
            make.height.equalTo(self.view.safeAreaLayoutGuide).dividedBy(15)
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
        
//        Admin.snp.makeConstraints { make in
//            make.height.equalTo(25)
//            make.leftMargin.rightMargin.equalTo(80)
//            make.centerX.equalToSuperview()
//            make.top.equalTo(PwBox.snp.bottom).offset(50)
//        }
//        Admin.addTarget(self, action: #selector(AdminBtn), for: .touchUpInside)
    }
    
    @objc fileprivate func GotoScheduleVC() {
        ID = IdTF.text ?? ""
        PW = PwTF.text ?? ""
        if ID == ""||PW == "" {
            AlertFunc(title: "입력이 잘못됨", message: "아이디나 비밀번호가 공백이 있습니다\n확인해주세요")
        } else {
            Login()
        }
        
    }
    
    @objc fileprivate func gotoSignupVC() {
        let SignupVC = SignupVC()
        self.navigationController?.pushViewController(SignupVC, animated: true)
        
    }
    
    @objc fileprivate func AdminBtn() {
        let MainTabBarControllerViewController = MainTabBarControllerViewController()
        self.navigationController?.pushViewController(MainTabBarControllerViewController, animated: true)
    }
    
    func Login() {
        let url = "http://54.180.122.62:8080/signin"
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 10
        
        // POST 로 보낼 정보
        let params = ["userId":ID, "password":PW] as Dictionary
        
        // httpBody 에 parameters 추가
        do {
            try request.httpBody = JSONSerialization.data(withJSONObject: params, options: [])
        } catch {
            print("http Body Error")
        }
        
        AF.request(request).responseString { result in
            do{
                print(result)
                let model = try JSONDecoder().decode(SignInInfo.self, from: result.data!)
                print(model.accessToken)
                TokenToken = model.accessToken
                UserDefaults.standard.set(TokenToken, forKey: "TokenToken")
                let giveToken = UserDefaults.standard.string(forKey: "TokenToken")
                print("보낼 토큰은 : \(giveToken ?? "notToken")")
                let MainTabBarControllerViewController = MainTabBarControllerViewController()
                self.navigationController?.pushViewController(MainTabBarControllerViewController, animated: true)
            } catch {
                print(result)
                print(error)
                self.AlertFunc(title: "아이디나 비밀번호 확인바람", message: "아이디나 비밀번호가 잘못되었습니다")
            }
        }
        
    }
    
    func AlertFunc(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        let action = UIAlertAction(
            title: "네",
            style: .default,
            handler: nil)
        alert.addAction(action)
               
        present(alert, animated: true, completion: nil)
    }
}


