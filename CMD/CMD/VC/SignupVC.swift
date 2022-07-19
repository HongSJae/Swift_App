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

var userID: String = ""
var userPW: String = ""

class SignupVC: UIViewController {
    
    private var LookPWBtn = UIButton().then {
        $0.setImage(UIImage(named: "eye"), for: .normal)
    }
    
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
    private var PwTF = UITextField().then {
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.placeholder = "비밀번호"
        $0.isSecureTextEntry = true
    }
    
    private var PwCBox = UIView().then {
        $0.backgroundColor = UIColor(named: "InputBox")
        $0.layer.cornerRadius = 10
    }
    private var PwCTF = UITextField().then {
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.placeholder = "비밀번호 확인"
        $0.isSecureTextEntry = true
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
        [IdBox, IdTF, PwBox, PwTF, PwCBox, PwCTF, CodeCheck, CodeCheckTF, Logo, SignupBtn, gotoLoginVCBtn, LookPWBtn].forEach({self.view.addSubview($0)})
        
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
        
        LookPWBtn.snp.makeConstraints {
            $0.centerY.equalTo(self.PwBox)
            $0.right.equalTo(self.PwBox.snp.right).inset(10)
        }
    }
    @objc fileprivate func Signup() {
//        userID = IdTF.text ?? ""
//        userPW = PwTF.text ?? ""
//        SignUp()
        if IdTF.text?.isEmpty == true || PwTF.text?.isEmpty == true || PwCTF.text?.isEmpty == true || CodeCheckTF.text?.isEmpty == true {
            AlertFunc(title: "공백이 있습니다", message: "모든 칸을 입력해주세요")
        } else {
            if PwTF.text != PwCTF.text {
                AlertFunc(title: "비밀번호가 다릅니다", message: "비밀번호와 비밀번호 확인에 \n적힌 값이 다릅니다! 확인해주세요!")
            } else {
                SignUp()
            }
        }
    }
    
    @objc fileprivate func GotoLoginVCBtn() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func SignUp() {
        
        let url = "http://54.180.122.62:8080/signup/" + (CodeCheckTF.text ?? "")
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 10
        
        // POST 로 보낼 정보
        let params = ["userId": userID, "password": userPW] as Dictionary
        
        // httpBody 에 parameters 추가
        do {
            try request.httpBody = JSONSerialization.data(withJSONObject: params, options: [])
        } catch {
            print("http Body Error")
        }
        
        AF.request(request).responseString { result in
            do{
                let model = try JSONDecoder().decode(SignUpInfo.self, from: result.data!)
                print("ID : \(ID), PW : \(PW)")
                self.navigationController?.popViewController(animated: true)
            } catch {
                print(error)
                self.AlertFunc(title: "가입코드가 다른데요?😅", message: "다시 확인 후 적어주세요!")
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

