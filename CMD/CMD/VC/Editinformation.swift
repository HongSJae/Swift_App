//
//  Editinformation.swift
//  CMD
//
//  Created by 홍승재 on 2022/08/19.
//

import UIKit
import Alamofire
import Then
import SnapKit
import SwiftUI

class Editinformation: UIViewController {
    
    
    //MARK: - 뷰 생성
    
    var MyBirth: String = ""
    var MyField: String = ""
    var MyName: String = ""
    var MyNumber: String = ""
    var MYID: String = ""
    
    private var BackBtn = UIButton().then {
        $0.setImage(UIImage(named: "back"), for: .normal)
    }
    
    //완료 버튼
    private var EditBtn = UIButton().then {
        $0.backgroundColor = .white
        $0.setTitle("수정", for: .normal)
        $0.titleLabel?.font = UIFont(name: "NotoSansKR-Medium", size: 18)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.layer.cornerRadius = 10
    }
    
    //현 비밀번호 입력란
    private var pwBox = UIView().then { _ in
    }
    
    private var pwLine = UIView().then {
        $0.backgroundColor = UIColor(named: "InputBox")
    }
    private var PwTf = UITextField().then {
        $0.isSecureTextEntry = true
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 18)
        $0.attributedPlaceholder = NSAttributedString(
            string: "*현 비밀번호",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray,
                         NSAttributedString.Key.font: UIFont(name: "NotoSansKR-Regular", size: 18)!]
        )
        $0.textColor = .white
    }
    
    //새 비밀번호 입력란
    private var NewPwBox = UIView().then {_ in
    }
    private var NewPwLine = UIView().then {
        $0.backgroundColor = UIColor(named: "InputBox")
    }
    private var NewPwTf = UITextField().then {
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 18)
        $0.isSecureTextEntry = true
        $0.attributedPlaceholder = NSAttributedString(
            string: "*새 비밀번호",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray,
                         NSAttributedString.Key.font: UIFont(name: "NotoSansKR-Regular", size: 18)!]
        )
        $0.textColor = .white
    }
    
    //비밀번호 확인 입력란
    private var NewPwCBox = UIView().then {_ in
    }
    private var NewPwCLine = UIView().then {
        $0.backgroundColor = UIColor(named: "InputBox")
    }
    private var NewPwCTf = UITextField().then {
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 18)
        $0.isSecureTextEntry = true
        $0.attributedPlaceholder = NSAttributedString(
            string: "*새 비밀번호 확인",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray,
                         NSAttributedString.Key.font: UIFont(name: "NotoSansKR-Regular", size: 18)!]
        )
        $0.textColor = .white
    }
    
    //생년월일 입력란
    private var BirthBox = UIView().then {_ in
    }
    private var BirthLine = UIView().then {
        $0.backgroundColor = UIColor(named: "InputBox")
    }
    private var BirthTf = UITextField().then {
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 18)
        $0.attributedPlaceholder = NSAttributedString(
            string: "생년월일",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray,
                         NSAttributedString.Key.font: UIFont(name: "NotoSansKR-Regular", size: 18)!]
        )
        $0.textColor = .white
    }
    
    //전공 입력란
    private var FieldBox = UIView().then {_ in
    }
    private var FieldLine = UIView().then {
        $0.backgroundColor = UIColor(named: "InputBox")
    }
    private var FieldTf = UITextField().then {
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 18)
        $0.attributedPlaceholder = NSAttributedString(
            string: "전공",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray,
                         NSAttributedString.Key.font: UIFont(name: "NotoSansKR-Regular", size: 18)!]
        )
        $0.textColor = .white
    }
    
    //헤더
    private var Header = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 50)
        $0.text = "정보 수정"
    }
    
    //비밀번호 invisible / visible 변경 버튼
    private var Eye1 = UIButton().then {
        $0.setImage(UIImage(named: "눈 뜸"), for: .normal)
        $0.alpha = 0
    }
    
    //비밀번호 invisible / visible 변경 버튼
    private var Eye2 = UIButton().then {
        $0.setImage(UIImage(named: "눈 뜸"), for: .normal)
        $0.alpha = 0
    }
    
    //비밀번호 invisible / visible 변경 버튼
    private var Eye3 = UIButton().then {
        $0.setImage(UIImage(named: "눈 뜸"), for: .normal)
        $0.alpha = 0
    }
    
    //MARK: - 뷰 실행 시
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //네비게이션바 숨기기
        self.navigationController?.isNavigationBarHidden = true
        //Eye버튼 이미지 변경
        PwTf.addTarget(self, action: #selector(PwTfeye), for: .editingChanged)
        NewPwTf.addTarget(self, action: #selector(NewPwTfeye), for: .editingChanged)
        NewPwCTf.addTarget(self, action: #selector(NewPwCTfeye), for: .editingChanged)
        
        self.view.backgroundColor = UIColor(named: "BackgroundColor")
        
        //뷰 선언
        [pwBox, pwLine, PwTf, NewPwBox, NewPwLine, NewPwTf, NewPwCBox, NewPwCLine, NewPwCTf, BirthBox, BirthLine, BirthTf, FieldBox, FieldLine, FieldTf, Eye1, Eye2, Eye3, Header, EditBtn, BackBtn].forEach({self.view.addSubview($0)})
        
        USERPASSWORD = UserDefaults.standard.string(forKey: "password")!
        token = UserDefaults.standard.string(forKey: "token")!
        
        GetMyinfo()
        
        openEye1 = false
        openEye2 = false
        openEye3 = false
        
        layout()
        setButton()
        
    }
    //MARK: - 학생정보 불러오기 함수
    
    func GetMyinfo() {
        print("GetMyinfo() - called")
        let url = "http://54.180.122.62:8080/user/myInfo"
        AF.request(url,
                   method: .get,
                   encoding: URLEncoding.queryString,
                   headers: ["Authorization": token]
        )
        .validate(statusCode: 200..<300)
        .response { result in
            do{
                let model = try JSONDecoder().decode(Myinfo.self, from: result.data!)
                print("success")
                
                self.MyBirth = model.birthday ?? "정보없음"
                self.MyField = model.field ?? "정보없음"
                self.MYID = model.userId!
                self.MyName = model.username!
                self.MyNumber = model.number!
                
            } catch {
                print("정보가 없어요")
                print(error)
            }
        }
    }
    
    
    //MARK: - 배경 터치 시 입력 중지
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    //MARK: - 버튼 액션 설정
    
    //정보수정 했을 시
    @objc fileprivate func Edit() {
        if PwTf.text?.isEmpty == false ||
            NewPwTf.text?.isEmpty == false ||
            NewPwCTf.text?.isEmpty == false {
            if USERPASSWORD == PwTf.text {
                if NewPwTf.text == NewPwCTf.text {
                    if BirthTf.text?.isEmpty == false {
                        MyBirth = BirthTf.text!
                    }
                    if FieldTf.text?.isEmpty == false {
                        MyField = FieldTf.text!
                    }
                    Editinformation(number: MyNumber, userid: MYID, password: NewPwTf.text!, birthday: MyBirth, field: MyField)
                } else {
                    AlertFunc(title: "오류", message: "다시 입력해주세요!\n새 비밀번호와 새 비밀번호 확인이 달라요!")
                }
            } else {
                AlertFunc(title: "오류", message: "현 비밀번호가 틀렸어요!\n다시 입력해주세요.")
            }
        } else {
            AlertFunc(title: "오류", message: "공백이 있어요!")
        }
    }
    
    //비밀번호 SecureTextEntry 설정
    @objc fileprivate func isSecureTextEntryBool1() {
        if openEye1 == true {
            Eye1.setImage(UIImage(named: "눈 뜸"), for: .normal)
            PwTf.isSecureTextEntry = true
            openEye1 = false
        } else {
            Eye1.setImage(UIImage(named: "눈 감음"), for: .normal)
            PwTf.isSecureTextEntry = false
            openEye1 = true
        }
    }
    
    //비밀번호 확인 SecureTextEntry 설정
    @objc fileprivate func isSecureTextEntryBool2() {
        if openEye2 == true {
            Eye2.setImage(UIImage(named: "눈 뜸"), for: .normal)
            NewPwTf.isSecureTextEntry = true
            openEye2 = false
        } else {
            Eye2.setImage(UIImage(named: "눈 감음"), for: .normal)
            NewPwTf.isSecureTextEntry = false
            openEye2 = true
        }
    }
    
    @objc fileprivate func isSecureTextEntryBool3() {
        if openEye3 == true {
            Eye3.setImage(UIImage(named: "눈 뜸"), for: .normal)
            NewPwCTf.isSecureTextEntry = true
            openEye3 = false
        } else {
            Eye3.setImage(UIImage(named: "눈 감음"), for: .normal)
            NewPwCTf.isSecureTextEntry = false
            openEye3 = true
        }
    }
    
    
    //비밀번호TextField에 값이 있을 때만 Eye를 띄움
    @objc func PwTfeye() {
        if let value = PwTf.text,
           value.isEmpty == false {
            Eye1.alpha = 1
        } else {
            Eye1.alpha = 0
        }
    }
    
    //비밀번호 확인 TextField에 값이 있을 때만 Eye를 띄움
    @objc func NewPwTfeye() {
        if let value = NewPwTf.text,
           value.isEmpty == false {
            Eye2.alpha = 1
        } else {
            Eye2.alpha = 0
        }
    }
    
    //비밀번호 확인 TextField에 값이 있을 때만 Eye를 띄움
    @objc func NewPwCTfeye() {
        if let value = NewPwCTf.text,
           value.isEmpty == false {
            Eye3.alpha = 1
        } else {
            Eye3.alpha = 0
        }
    }
    
    //돌아가기
    @objc fileprivate func Back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - 정보수정 함수
    
    func Editinformation(number: String, userid: String, password: String, birthday: String, field: String) {
        
        print("number : \(number)")
        print("userid : \(userid)")
        print("password : \(password)")
        print("field : \(field)")
        print("birthday : \(birthday)")
        
        let url = "http://54.180.122.62:8080/user/myInfoUpdate"
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 10
        
        // POST 로 보낼 정보
        let params: Parameters = [
            "password":password,
            "birthday":birthday,
            "field":field
        ] as Dictionary
        
        // httpBody 에 parameters 추가
        do {
            try request.httpBody = JSONSerialization.data(withJSONObject: params, options: [])
            request.headers = ["Authorization": (token)]
        } catch {
            print("http Body Error")
        }
        
        AF.request(request)
        .validate(statusCode: 200..<300)
        .responseData { response in
            let alert = UIAlertController(
                title: "회원정보 수정",
                message: "정말로 회원님의 정보를 수정하시겠습니까?\n수정하시면 다시 로그인 해야합니다.",
                preferredStyle: .alert)
            let action = UIAlertAction(
                title: "네",
                style: .default,
                handler: { ACTION in
                    print("Edit")
                    let LoginVC = LoginVC()
                    self.navigationController?.pushViewController(LoginVC, animated: true)
                    self.tabBarController?.tabBar.isHidden = true
                })
            let cancel = UIAlertAction(
                title: "아니요",
                style: .destructive,
                handler: nil)
            alert.addAction(action)
            alert.addAction(cancel)
                   
            self.present(alert, animated: true, completion: nil)

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
    //MARK: - 레이아웃
    func layout() {

        BackBtn.snp.makeConstraints {
            $0.topMargin.equalTo(20)
            $0.leftMargin.equalTo(20)
            $0.height.width.equalTo(30)
        }
        
        //헤더 레이아웃
        Header.snp.makeConstraints { make in
            make.topMargin.equalTo(80)
            make.leftMargin.equalTo(48)
        }
        
        //현 비밀번호 레이아웃
        pwBox.snp.makeConstraints { make in
            make.leftMargin.rightMargin.equalTo(40)
            make.height.equalTo(self.view.safeAreaLayoutGuide).dividedBy(15)
            make.centerX.equalToSuperview()
            make.top.equalTo(Header.snp.bottom).offset(40)
        }
        pwLine.snp.makeConstraints {
            $0.height.equalTo(2)
            $0.leftMargin.rightMargin.equalTo(40)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(self.pwBox.snp.bottom).offset(0)
        }
        PwTf.snp.makeConstraints { make in
            make.height.equalTo(26)
            make.width.equalTo(250)
            make.bottom.equalTo(pwBox.snp.bottom).inset(5)
            make.leading.equalTo(pwBox.snp.leading).inset(10)
        }
        
        //비밀번호 invisible / visible 레이아웃
        Eye1.snp.makeConstraints {
            $0.height.equalTo(17)
            $0.width.equalTo(22)
            $0.top.equalTo(pwBox.snp.top).inset(30)
            $0.right.equalTo(pwBox.snp.right).inset(10)
        }
        
        //새 비밀번호 레이아웃
        NewPwBox.snp.makeConstraints { make in
            make.leftMargin.rightMargin.equalTo(40)
            make.height.equalTo(self.view.safeAreaLayoutGuide).dividedBy(15)
            make.centerX.equalToSuperview()
            make.top.equalTo(pwBox.snp.bottom).offset(31)
        }
        NewPwLine.snp.makeConstraints {
            $0.height.equalTo(2)
            $0.leftMargin.rightMargin.equalTo(40)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(self.NewPwBox.snp.bottom).offset(0)
        }
        NewPwTf.snp.makeConstraints { make in
            make.height.equalTo(26)
            make.width.equalTo(250)
            make.bottom.equalTo(NewPwBox.snp.bottom).inset(5)
            make.leading.equalTo(NewPwBox.snp.leading).inset(10)
        }
        
        //비밀번호 invisible / visible 레이아웃
        Eye2.snp.makeConstraints {
            $0.height.equalTo(17)
            $0.width.equalTo(22)
            $0.top.equalTo(NewPwBox.snp.top).inset(30)
            $0.right.equalTo(NewPwBox.snp.right).inset(10)
        }
        
        //비밀번호 레이아웃
        NewPwCBox.snp.makeConstraints { make in
            make.leftMargin.rightMargin.equalTo(40)
            make.height.equalTo(self.view.safeAreaLayoutGuide).dividedBy(15)
            make.centerX.equalToSuperview()
            make.top.equalTo(NewPwBox.snp.bottom).offset(31)
        }
        NewPwCLine.snp.makeConstraints {
            $0.height.equalTo(2)
            $0.leftMargin.rightMargin.equalTo(40)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(self.NewPwCBox.snp.bottom).offset(0)
        }
        NewPwCTf.snp.makeConstraints { make in
            make.height.equalTo(26)
            make.width.equalTo(250)
            make.bottom.equalTo(NewPwCBox.snp.bottom).inset(5)
            make.leading.equalTo(NewPwCBox.snp.leading).inset(10)
        }
        
        //비밀번호 확인 invisible / visible 레이아웃
        Eye3.snp.makeConstraints {
            $0.height.equalTo(17)
            $0.width.equalTo(22)
            $0.top.equalTo(NewPwCBox.snp.top).inset(30)
            $0.right.equalTo(NewPwCBox.snp.right).inset(10)
        }
        
        //생년월일 레이아웃
        BirthBox.snp.makeConstraints { make in
            make.leftMargin.rightMargin.equalTo(40)
            make.height.equalTo(self.view.safeAreaLayoutGuide).dividedBy(15)
            make.centerX.equalToSuperview()
            make.top.equalTo(NewPwCBox.snp.bottom).offset(31)
        }
        BirthLine.snp.makeConstraints {
            $0.height.equalTo(2)
            $0.leftMargin.rightMargin.equalTo(40)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(self.BirthBox.snp.bottom).offset(0)
        }
        BirthTf.snp.makeConstraints { make in
            make.height.equalTo(26)
            make.width.equalTo(250)
            make.bottom.equalTo(BirthBox.snp.bottom).inset(5)
            make.leading.equalTo(BirthBox.snp.leading).inset(10)
        }
        
        //전공 레이아웃
        FieldBox.snp.makeConstraints { make in
            make.leftMargin.rightMargin.equalTo(40)
            make.height.equalTo(self.view.safeAreaLayoutGuide).dividedBy(15)
            make.centerX.equalToSuperview()
            make.top.equalTo(BirthBox.snp.bottom).offset(31)
        }
        FieldLine.snp.makeConstraints {
            $0.height.equalTo(2)
            $0.leftMargin.rightMargin.equalTo(40)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(self.FieldBox.snp.bottom).offset(0)
        }
        FieldTf.snp.makeConstraints { make in
            make.height.equalTo(26)
            make.width.equalTo(250)
            make.bottom.equalTo(FieldBox.snp.bottom).inset(5)
            make.leading.equalTo(FieldBox.snp.leading).inset(10)
        }
        
        //완료 레이아웃
        EditBtn.snp.makeConstraints { make in
            make.height.equalTo(self.view.safeAreaLayoutGuide).dividedBy(15)
            make.leftMargin.rightMargin.equalTo(40)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(80)
        }
    }
    
    //MARK: - 버튼 액션 실행 함수
    
    func setButton() {
        //회원가입하기 버튼
        EditBtn.addTarget(self, action: #selector(Edit), for: .touchUpInside)
        
        //비밀번호 invisible / visivble 바꾸기 버튼
        Eye1.addTarget(self, action: #selector(isSecureTextEntryBool1), for: .touchUpInside)
        
        //비밀번호 확인 invisible / visivble 바꾸기 버튼
        Eye2.addTarget(self, action: #selector(isSecureTextEntryBool2), for: .touchUpInside)
        
        //비밀번호 확인 invisible / visivble 바꾸기 버튼
        Eye3.addTarget(self, action: #selector(isSecureTextEntryBool3), for: .touchUpInside)
        
        //돌아가기 버튼
        BackBtn.addTarget(self, action: #selector(Back), for: .touchUpInside)
    }
}

