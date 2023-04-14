//
//  LoginVCViewController.swift
//  CMD
//
//  Created by 홍승재 on 2022/06/30.
//

import UIKit
import SnapKit
import Alamofire
import Then
import TextFieldEffects

//MARK: - 전역 변수 선언 (token, ID, PW, openEye)

var token: String = ""
var ID: String = ""
var PW: String = ""

var USERPASSWORD: String = ""

var openEye: Bool = false

class LoginVC: UIViewController {
    
    //MARK: - 뷰 생성
    
    //로그인 버튼
    private var LoginBtn = UIButton().then {
        $0.backgroundColor = .white
        $0.setTitle("로그인", for: .normal)
        $0.titleLabel?.font = UIFont(name: "NotoSansKR-Medium", size: 18)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.layer.cornerRadius = 10
    }
    
    //관리자 버튼
    private var Admin = UIButton().then {
        $0.backgroundColor = .lightGray
        $0.setTitle("관리자", for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.layer.cornerRadius = 10
    }
    
    //회원가입 하러가기 버튼
    private var gotoSignupVCBtn1 = UIButton().then {
        $0.setTitle("아이디가 없으신가요?                   ", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        $0.setTitleColor(UIColor.white, for: .normal)
    }
    private var gotoSignupVCBtn2 = UIButton().then {
        $0.setTitle("                            회원가입", for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        $0.setTitleColor(UIColor.white, for: .normal)
    }
    
    //아이디 입력란
    private var IdBox = UIView()
    
    private var Idline = UIView().then {
        $0.backgroundColor = UIColor(named: "InputBox")
    }
    private var IdTF = UITextField().then {
        
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 18)
        $0.placeholder = "아이디"
        $0.attributedPlaceholder = NSAttributedString(
            string: "아이디",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray,
                         NSAttributedString.Key.font: UIFont(name: "NotoSansKR-Regular", size: 18)!]
        )
        $0.textColor = .white
    }
    
    //비밀번호 입력란
    private var PwBox = UIView()
    
    private var Pwline = UIView().then {
        $0.backgroundColor = UIColor(named: "InputBox")
    }
    private var PwTF = UITextField().then {
        $0.isSecureTextEntry = true
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 18)
        $0.attributedPlaceholder = NSAttributedString(
            string: "비밀번호",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray,
                         NSAttributedString.Key.font: UIFont(name: "NotoSansKR-Regular", size: 18)!]
        )
        $0.textColor = .white
    }
    
    //헤더
    private var Header = UILabel().then {
        $0.text = "로그인"
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 50)
        $0.textColor = .white
    }
    
    //비밀번호 invisible / visible 변경 버튼
    private var Eye = UIButton().then {
        $0.setImage(UIImage(named: "눈 뜸"), for: .normal)
        $0.alpha = 0
    }
    
    //MARK: - 뷰 실행 시
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //네이게이션 바 숨기기
        navigationController?.setNavigationBarHidden(true, animated: true)
        //Eye버튼 이미지 변경
        PwTF.addTarget(self, action: #selector(PwTFeye), for: .editingChanged)
        
        self.view.backgroundColor = UIColor(named: "BackgroundColor")
        
        //뷰 선언
        [Header, IdBox, IdTF, PwBox, PwTF, LoginBtn, gotoSignupVCBtn1, gotoSignupVCBtn2,Admin,Eye, Idline, Pwline].forEach({view.addSubview($0)})

        layout()
        setButton()
        
    }
    
    //MARK: - 배경 터치 시 입력 중지
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    //MARK: - 버튼 액션 설정
    
    //로그인 했을 시
    @objc fileprivate func GotoScheduleVC() {
        ID = IdTF.text ?? ""
        PW = PwTF.text ?? ""
        if ID == ""||PW == "" {
            //ID나 PW가 공백일 때
            AlertFunc(title: "입력이 잘못됨", message: "아이디나 비밀번호가 공백이 있습니다\n확인해주세요")
        } else {
            //아니면 로그인
            Login()
        }
        
    }
    
    //회원가입 하러가기
    @objc fileprivate func gotoSignupVC() {
        let SignupVC = SignupVC()
        self.navigationController?.pushViewController(SignupVC, animated: true)
    }
    
    //로그인 하지 않고 그냥 다음 뷰로 넘어감
    @objc fileprivate func AdminBtn() {
        let MainTabBarControllerViewController = MainTabBarControllerViewController()
        self.navigationController?.pushViewController(MainTabBarControllerViewController, animated: true)
    }
    
    //비밀번호 SecureTextEntry 설정
    @objc fileprivate func isSecureTextEntryBool() {
        if openEye == true {
            Eye.setImage(UIImage(named: "눈 뜸"), for: .normal)
            PwTF.isSecureTextEntry = true
            openEye = false
        } else {
            Eye.setImage(UIImage(named: "눈 감음"), for: .normal)
            PwTF.isSecureTextEntry = false
            openEye = true
        }
    }
    
    //비밀번호TextField에 값이 있을 때만 Eye를 띄움
    @objc func PwTFeye() {
        if let value = PwTF.text,
           value.isEmpty == false {
            Eye.alpha = 1
        } else {
            Eye.alpha = 0
        }
    }
    
    //MARK: - 로그인 함수
    
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
                let model = try JSONDecoder().decode(SignInInfo.self, from: result.data!)
                token = model.accessToken
                UserDefaults.standard.set(token, forKey: "token")
                let giveToken = UserDefaults.standard.string(forKey: "token")
                print("보낼 토큰은 : \(giveToken ?? "notToken")")
                
                USERPASSWORD = PW
                UserDefaults.standard.set(USERPASSWORD, forKey: "password")
                
                //뷰 이동
                let MainTabBarControllerViewController = MainTabBarControllerViewController()
                self.navigationController?.pushViewController(MainTabBarControllerViewController, animated: true)
            } catch {
                print(result)
                print(error)
                self.AlertFunc(title: "아이디나 비밀번호 확인바람", message: "아이디나 비밀번호가 잘못되었습니다")
            }
        }
    }
    
    //MARK: - Alert 만드는 함수
    
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
    
    //MARK: - 레이아웃 설정 함수
    
    func layout() {
        //아이디 레이아웃
        IdBox.snp.makeConstraints { make in
            make.leftMargin.rightMargin.equalTo(40)
            make.height.equalTo(self.view.safeAreaLayoutGuide).dividedBy(15)
            make.centerX.equalToSuperview()
            make.top.equalTo(Header.snp.bottom).offset(70)
        }
        Idline.snp.makeConstraints {
            $0.height.equalTo(2)
            $0.leftMargin.rightMargin.equalTo(40)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(self.IdBox.snp.bottom).offset(0)
        }
        IdTF.snp.makeConstraints { make in
            make.height.equalTo(26)
            make.width.equalTo(250)
            make.bottom.equalTo(IdBox.snp.bottom).inset(5)
            make.leading.equalTo(IdBox.snp.leading).inset(10)
        }
        
        //비밀번호 레이아웃
        PwBox.snp.makeConstraints { make in
            make.leftMargin.rightMargin.equalTo(40)
            make.height.equalTo(self.view.safeAreaLayoutGuide).dividedBy(15)
            make.centerX.equalToSuperview()
            make.top.equalTo(IdBox.snp.bottom).offset(46)
        }
        Pwline.snp.makeConstraints {
            $0.height.equalTo(2)
            $0.leftMargin.rightMargin.equalTo(40)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(PwBox.snp.bottom).offset(0)
        }
        PwTF.snp.makeConstraints { make in
            make.height.equalTo(26)
            make.width.equalTo(250)
            make.bottom.equalTo(PwBox.snp.bottom).inset(5)
            make.leading.equalTo(PwBox.snp.leading).inset(10)
        }
        
        //비밀번호 invisible / visible 레이아웃
        Eye.snp.makeConstraints {
            $0.height.equalTo(17)
            $0.width.equalTo(22)
            $0.top.equalTo(PwBox.snp.top).inset(30)
            $0.right.equalTo(PwBox.snp.right).inset(10)
        }
        
        //헤더 레이아웃
        Header.snp.makeConstraints { make in
            make.topMargin.equalTo(74)
            make.leftMargin.equalTo(50)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(100)
        }
        
        //로그인 버튼 레이아웃
        LoginBtn.snp.makeConstraints { make in
            make.height.equalTo(self.view.safeAreaLayoutGuide).dividedBy(15)
            make.leftMargin.rightMargin.equalTo(40)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(132)
        }
        
        //회원가입 하러가기 버튼 레이아웃
        gotoSignupVCBtn1.snp.makeConstraints { make in
            make.height.equalTo(17)
            make.width.equalTo(166)
            make.centerX.equalToSuperview()
            make.top.equalTo(LoginBtn.snp.bottom).offset(26)
        }
        gotoSignupVCBtn2.snp.makeConstraints { make in
            make.height.equalTo(17)
            make.width.equalTo(166)
            make.centerX.equalToSuperview()
            make.top.equalTo(LoginBtn.snp.bottom).offset(26)
        }
        
        //관리자 버튼 레이아웃
//        Admin.snp.makeConstraints { make in
//            make.height.equalTo(25)
//            make.leftMargin.rightMargin.equalTo(80)
//            make.centerX.equalToSuperview()
//            make.top.equalTo(PwBox.snp.bottom).offset(50)
//        }
    }
    
    //MARK: - 버튼 액션 실행 함수
    
    func setButton() {
        
        //비밀번호 invisible / visivble 바꾸기 버튼
        Eye.addTarget(self, action: #selector(isSecureTextEntryBool), for: .touchUpInside)
        
        //로그인하기 버튼
        LoginBtn.addTarget(self, action: #selector(GotoScheduleVC), for: .touchUpInside)
        
        //회원가입 하러가기 버튼
        gotoSignupVCBtn1.addTarget(self, action: #selector(gotoSignupVC), for: .touchUpInside)
        gotoSignupVCBtn2.addTarget(self, action: #selector(gotoSignupVC), for: .touchUpInside)
        Admin.addTarget(self, action: #selector(AdminBtn), for: .touchUpInside)
    }
}

//MARK: - swift ui로 뷰 보기

#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    
    // update
    func updateUIViewController(_ uiViewController: UITabBarController, context: Context) {
        
    }
    // makeui
    @available(iOS 13.0, *)
    func makeUIViewController(context: Context) -> UITabBarController {
        MainTabBarControllerViewController()
    }
}
        
struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ViewControllerRepresentable()
                .edgesIgnoringSafeArea(.all)
                .previewDisplayName("미리보기")
                .previewInterfaceOrientation(.portrait)
        }
    }
}


#endif
