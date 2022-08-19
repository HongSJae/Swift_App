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

class Editinformation: UIViewController {
    

    //MARK: - 뷰 생성
    
    //완료 버튼
    private var EditBtn = UIButton().then {
        $0.backgroundColor = .white
        $0.setTitle("완료", for: .normal)
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
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 18)
        $0.attributedPlaceholder = NSAttributedString(
            string: "현 비밀번호",
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
            string: "새 비밀번호",
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
            string: "새 비밀번호 확인",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray,
                         NSAttributedString.Key.font: UIFont(name: "NotoSansKR-Regular", size: 18)!]
        )
        $0.textColor = .white
    }
    
    //헤더
    private var Header = UILabel().then {
        $0.text = "비밀번호 변경"
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 40)
        $0.textColor = .white
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
        [pwBox, pwLine, PwTf, NewPwBox, NewPwLine, NewPwTf, NewPwCBox, NewPwCLine, NewPwCTf, Eye1, Eye2, Eye3].forEach({self.view.addSubview($0)})
        
        openEye1 = false
        openEye2 = false
        openEye3 = false
        
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
            Eye2.alpha = 1
        } else {
            Eye2.alpha = 0
        }
    }
    
    //MARK: - 회원가입 함수
    
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
        
        //현 비밀번호 레이아웃
        pwBox.snp.makeConstraints { make in
            make.leftMargin.rightMargin.equalTo(40)
            make.height.equalTo(self.view.safeAreaLayoutGuide).dividedBy(15)
            make.centerX.equalToSuperview()
            make.top.equalTo(Header.snp.bottom).offset(52)
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

        //완료 레이아웃
        EditBtn.snp.makeConstraints { make in
            make.height.equalTo(self.view.safeAreaLayoutGuide).dividedBy(15)
            make.leftMargin.rightMargin.equalTo(40)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(120)
        }
    }
    
    //MARK: - 버튼 액션 실행 함수
    
    func setButton() {
        //회원가입하기 버튼
        EditBtn.addTarget(self, action: #selector(Signup), for: .touchUpInside)
        
        //비밀번호 invisible / visivble 바꾸기 버튼
        Eye1.addTarget(self, action: #selector(isSecureTextEntryBool1), for: .touchUpInside)
        
        //비밀번호 확인 invisible / visivble 바꾸기 버튼
        Eye2.addTarget(self, action: #selector(isSecureTextEntryBool2), for: .touchUpInside)
        
        //비밀번호 확인 invisible / visivble 바꾸기 버튼
        Eye3.addTarget(self, action: #selector(isSecureTextEntryBool3), for: .touchUpInside)
    }
}
