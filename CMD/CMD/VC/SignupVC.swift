//
//  SignupViewController.swift
//  CMD
//
//  Created by 홍승재 on 2022/06/30.
//

import UIKit
import SnapKit
import Alamofire
import Then

//MARK: - 전역 변수 선언 (userID, userPW, openEye(1,2))

var userID: String = ""
var userPW: String = ""

var openEye1: Bool = false
var openEye2: Bool = false
var openEye3: Bool = false

class SignupVC: UIViewController {
    
    //MARK: - 뷰 생성
    
    //회원가입 버튼
    private var SignupBtn = UIButton().then {
        $0.backgroundColor = .white
        $0.setTitle("회원가입", for: .normal)
        $0.titleLabel?.font = UIFont(name: "NotoSansKR-Medium", size: 18)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.layer.cornerRadius = 10
    }
    
    //로그인 하러가기 버튼
    private var gotoLoginVCBtn1 = UIButton().then {
        $0.setTitle("계정이 있으신가요?               ", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        $0.setTitleColor(UIColor.white, for: .normal)
    }
    private var gotoLoginVCBtn2 = UIButton().then {
        $0.setTitle("                        로그인", for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        $0.setTitleColor(UIColor.white, for: .normal)
    }
    
    //아이디 입력란
    private var IdBox = UIView().then {_ in
    }
    private var Idline = UIView().then {
        $0.backgroundColor = UIColor(named: "InputBox")
    }
    private var IdTF = UITextField().then {
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 18)
        $0.attributedPlaceholder = NSAttributedString(
            string: "아이디",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray,
                         NSAttributedString.Key.font: UIFont(name: "NotoSansKR-Regular", size: 18)!]
        )
        $0.textColor = .white
    }
    
    //비밀번호 입력란
    private var PwBox = UIView().then {_ in
    }
    private var PwLine = UIView().then {
        $0.backgroundColor = UIColor(named: "InputBox")
    }
    private var PwTF = UITextField().then {
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 18)
        $0.isSecureTextEntry = true
        $0.attributedPlaceholder = NSAttributedString(
            string: "비밀번호",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray,
                         NSAttributedString.Key.font: UIFont(name: "NotoSansKR-Regular", size: 18)!]
        )
        $0.textColor = .white
    }
    
    //비밀번호 invisible / visible 변경 버튼
    private var Eye1 = UIButton().then {
        $0.setImage(UIImage(named: "눈 뜸"), for: .normal)
        $0.alpha = 0
    }
    
    //비밀번호 확인 입력란
    private var PwCBox = UIView().then {_ in
    }
    private var PwCLine = UIView().then {
        $0.backgroundColor = UIColor(named: "InputBox")
    }
    private var PwCTF = UITextField().then {
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 18)
        $0.isSecureTextEntry = true
        $0.attributedPlaceholder = NSAttributedString(
            string: "비밀번호 확인",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray,
                         NSAttributedString.Key.font: UIFont(name: "NotoSansKR-Regular", size: 18)!]
        )
        $0.textColor = .white
    }
    
    //비밀번호 확인 invisible / visible 변경 버튼
    private var Eye2 = UIButton().then {
        $0.setImage(UIImage(named: "눈 뜸"), for: .normal)
        $0.alpha = 0
    }
    
    //코드 입력란
    private var CodeCheck = UIView().then {_ in
    }
    private var CodeLine = UIView().then {
        $0.backgroundColor = UIColor(named: "InputBox")
    }
    private var CodeCheckTF = UITextField().then {
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 18)
        $0.attributedPlaceholder = NSAttributedString(
            string: "가입코드",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray,
                         NSAttributedString.Key.font: UIFont(name: "NotoSansKR-Regular", size: 18)!]
        )
        $0.textColor = .white
    }
    
    //헤더
    private var Header = UILabel().then {
        $0.text = "회원가입"
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 50)
        $0.textColor = .white
    }
    
    //MARK: - 뷰 실행 시
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //네비게이션바 숨기기
        self.navigationController?.isNavigationBarHidden = true
        //Eye버튼 이미지 변경
        PwTF.addTarget(self, action: #selector(PwTFeye), for: .editingChanged)
        PwCTF.addTarget(self, action: #selector(PwCTFeye), for: .editingChanged)
        
        self.view.backgroundColor = UIColor(named: "BackgroundColor")
        
        //뷰 선언
        [IdBox, IdTF, Idline, PwBox, PwTF, PwLine, PwCBox, PwCTF, PwCLine, CodeCheck, CodeCheckTF, CodeLine, Header, SignupBtn, gotoLoginVCBtn1,gotoLoginVCBtn2, Eye1, Eye2].forEach({self.view.addSubview($0)})
        
        layout()
        setButton()
        
    }
    
    //MARK: - 배경 터치 시 입력 중지
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }

    //MARK: - 버튼 액션 설정
    
    //회원가입 했을 시
    @objc fileprivate func Signup() {
        if IdTF.text?.isEmpty == true || PwTF.text?.isEmpty == true || PwCTF.text?.isEmpty == true || CodeCheckTF.text?.isEmpty == true {
            AlertFunc(title: "공백이 있습니다", message: "모든 칸을 입력해주세요")
        } else {
            if PwTF.text != PwCTF.text {
                AlertFunc(title: "비밀번호가 다릅니다", message: "비밀번호와 비밀번호 확인에 \n적힌 값이 다릅니다! 확인해주세요!")
            } else {
                userID = IdTF.text ?? ""
                userPW = PwTF.text ?? ""
                SignUp()
            }
        }
    }
    
    //로그인 하러가기
    @objc fileprivate func GotoLoginVCBtn() {
        self.navigationController?.popViewController(animated: true)
    }
    
    //비밀번호 SecureTextEntry 설정
    @objc fileprivate func isSecureTextEntryBool1() {
        if openEye1 == true {
            Eye1.setImage(UIImage(named: "눈 뜸"), for: .normal)
            PwTF.isSecureTextEntry = true
            openEye1 = false
        } else {
            Eye1.setImage(UIImage(named: "눈 감음"), for: .normal)
            PwTF.isSecureTextEntry = false
            openEye1 = true
        }
    }
    
    //비밀번호 확인 SecureTextEntry 설정
    @objc fileprivate func isSecureTextEntryBool2() {
        if openEye2 == true {
            Eye2.setImage(UIImage(named: "눈 뜸"), for: .normal)
            PwCTF.isSecureTextEntry = true
            openEye2 = false
        } else {
            Eye2.setImage(UIImage(named: "눈 감음"), for: .normal)
            PwCTF.isSecureTextEntry = false
            openEye2 = true
        }
    }
    
    //비밀번호TextField에 값이 있을 때만 Eye를 띄움
    @objc func PwTFeye() {
        if let value = PwTF.text,
           value.isEmpty == false {
            Eye1.alpha = 1
        } else {
            Eye1.alpha = 0
        }
    }
    
    //비밀번호 확인 TextField에 값이 있을 때만 Eye를 띄움
    @objc func PwCTFeye() {
        if let value = PwCTF.text,
           value.isEmpty == false {
            Eye2.alpha = 1
        } else {
            Eye2.alpha = 0
        }
    }
    
    //MARK: - 회원가입 함수
    
    func SignUp() {
        
        let url = "http://54.180.122.62:8080/signup/" + (CodeCheckTF.text ?? "")
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 10
        
        // POST 로 보낼 정보
        let params = ["userId": userID, "password": userPW] as Dictionary
        print("\(userID), \(userPW) 를 POST")
        // httpBody 에 parameters 추가
        do {
            try request.httpBody = JSONSerialization.data(withJSONObject: params, options: [])
        } catch {
            print("http Body Error")
        }
        
        AF.request(request).responseString { result in
            do{
                _ = try JSONDecoder().decode(SignUpInfo.self, from: result.data!)
                print("회원가입 성공")
                self.navigationController?.popViewController(animated: true)
            } catch {
                print(error)
                self.AlertFunc(title: "가입코드가 다른데요?😅", message: "다시 확인 후 적어주세요!")
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
    
     
    
    func layout() {
        //헤더 레이아웃
        Header.snp.makeConstraints { make in
            make.topMargin.equalTo(74)
            make.leftMargin.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(100)
        }
        
        //아이디 레이아웃
        IdBox.snp.makeConstraints { make in
            make.leftMargin.rightMargin.equalTo(40)
            make.height.equalTo(self.view.safeAreaLayoutGuide).dividedBy(15)
            make.centerX.equalToSuperview()
            make.top.equalTo(Header.snp.bottom).offset(52)
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
            make.top.equalTo(IdBox.snp.bottom).offset(31)
        }
        PwLine.snp.makeConstraints {
            $0.height.equalTo(2)
            $0.leftMargin.rightMargin.equalTo(40)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(self.PwBox.snp.bottom).offset(0)
        }
        PwTF.snp.makeConstraints { make in
            make.height.equalTo(26)
            make.width.equalTo(250)
            make.bottom.equalTo(PwBox.snp.bottom).inset(5)
            make.leading.equalTo(PwBox.snp.leading).inset(10)
        }
        
        //비밀번호 invisible / visible 레이아웃
        Eye1.snp.makeConstraints {
            $0.height.equalTo(17)
            $0.width.equalTo(22)
            $0.top.equalTo(PwBox.snp.top).inset(30)
            $0.right.equalTo(PwBox.snp.right).inset(10)
        }
        
        //비밀번호 레이아웃
        PwCBox.snp.makeConstraints { make in
            make.leftMargin.rightMargin.equalTo(40)
            make.height.equalTo(self.view.safeAreaLayoutGuide).dividedBy(15)
            make.centerX.equalToSuperview()
            make.top.equalTo(PwBox.snp.bottom).offset(31)
        }
        PwCLine.snp.makeConstraints {
            $0.height.equalTo(2)
            $0.leftMargin.rightMargin.equalTo(40)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(self.PwCBox.snp.bottom).offset(0)
        }
        PwCTF.snp.makeConstraints { make in
            make.height.equalTo(26)
            make.width.equalTo(250)
            make.bottom.equalTo(PwCBox.snp.bottom).inset(5)
            make.leading.equalTo(PwCBox.snp.leading).inset(10)
        }
        
        //비밀번호 확인 invisible / visible 레이아웃
        Eye2.snp.makeConstraints {
            $0.height.equalTo(17)
            $0.width.equalTo(22)
            $0.top.equalTo(PwCBox.snp.top).inset(30)
            $0.right.equalTo(PwCBox.snp.right).inset(10)
        }
        
        //가입코드 레이아웃
        CodeCheck.snp.makeConstraints { make in
            make.leftMargin.rightMargin.equalTo(40)
            make.height.equalTo(self.view.safeAreaLayoutGuide).dividedBy(15)
            make.centerX.equalToSuperview()
            make.top.equalTo(PwCBox.snp.bottom).offset(31)
        }
        CodeLine.snp.makeConstraints {
            $0.height.equalTo(2)
            $0.leftMargin.rightMargin.equalTo(40)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(self.CodeCheck.snp.bottom).offset(0)
        }
        CodeCheckTF.snp.makeConstraints { make in
            make.height.equalTo(26)
            make.width.equalTo(250)
            make.bottom.equalTo(CodeCheck.snp.bottom).inset(5)
            make.leading.equalTo(CodeCheck.snp.leading).inset(10)
        }

        //회원가입 레이아웃
        SignupBtn.snp.makeConstraints { make in
            make.height.equalTo(self.view.safeAreaLayoutGuide).dividedBy(15)
            make.leftMargin.rightMargin.equalTo(40)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(120)
        }
        
        //로그인 하러가기 버튼 레이아웃
        gotoLoginVCBtn1.snp.makeConstraints { make in
            make.height.equalTo(17)
            make.width.equalTo(166)
            make.centerX.equalToSuperview()
            make.top.equalTo(SignupBtn.snp.bottom).offset(26)
        }
        gotoLoginVCBtn2.snp.makeConstraints { make in
            make.height.equalTo(17)
            make.width.equalTo(166)
            make.centerX.equalToSuperview()
            make.top.equalTo(SignupBtn.snp.bottom).offset(26)
        }
    }
    
    //MARK: - 버튼 액션 실행 함수
    
    func setButton() {
        //회원가입하기 버튼
        SignupBtn.addTarget(self, action: #selector(Signup), for: .touchUpInside)
        
        //비밀번호 invisible / visivble 바꾸기 버튼
        Eye1.addTarget(self, action: #selector(isSecureTextEntryBool1), for: .touchUpInside)
        
        //비밀번호 확인 invisible / visivble 바꾸기 버튼
        Eye2.addTarget(self, action: #selector(isSecureTextEntryBool2), for: .touchUpInside)
        
        //로그인 하러가기 버튼
        gotoLoginVCBtn1.addTarget(self, action: #selector(GotoLoginVCBtn), for: .touchUpInside)
        gotoLoginVCBtn2.addTarget(self, action: #selector(GotoLoginVCBtn), for: .touchUpInside)
    }
}

