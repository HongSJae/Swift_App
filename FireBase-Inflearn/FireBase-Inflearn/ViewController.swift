//
//  ViewController.swift
//  FireBase-Inflearn
//
//  Created by 홍승재 on 2022/07/07.
//

import UIKit
import Firebase
import FirebaseAuth


class ViewController: UIViewController {
    
    @IBOutlet weak var LabelLogin: UILabel!
    
    @IBOutlet weak var TextFieldId: UITextField!
    
    @IBOutlet weak var TextFieldPw: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    func updateUI() {
        TextFieldId.text = ""
        TextFieldPw.text = ""
        if let user = Auth.auth().currentUser {
            //로그인 된 상태(세션 지원-자동 로그인 지원)
            LabelLogin.text = "로그인 상태: \(user.email!)"
            
        } else {
            //로그아웃 된 상태
            LabelLogin.text = "로그인 상태: 로그아웃"
            
        }
    }
    @IBAction func onBtnLogin(_ sender: UIButton) {
        if let TextID = TextFieldId.text,
           let TextPW = TextFieldPw.text {
            
            if TextID.count < 1 || TextPW.count < 1 {
                print("아이디나 비밀번호가 너무 짧습니다 :(")
                return;
            }
            print("\(TextID), \(TextPW)")
            Auth.auth().signIn(withEmail: TextID, password: TextPW) {
                //후행 클로저
                [weak self] user, error in
                guard let _ = self else { return }
                let user = Auth.auth().currentUser
                
                if let userEmail = user?.email,
                   let userUid = user?.uid {
                    print("로그인 성공 :)")
                    print("\(String(describing: user?.email)), \(String(describing: user?.uid))")
                    
                    self?.updateUI()
                } else {
                    print("로그인 실패")
                    self?.updateUI()
                }
            }
            
        } else {
            print("로그인 계정 또는 비밀번호를 확인해주세요 :)")
        }
    }
    @IBAction func onBtnLogout(_ sender: UIButton) {
        let FirebaseAuth = Auth.auth()
        do {
            try FirebaseAuth.signOut()
            print("로그아웃 되었습니다 :)")
        } catch let signOutError as NSError {
            print("signOutError: %@", signOutError)
        }
        
        updateUI()
    }
    
    @IBAction func onBtnJoin(_ sender: UIButton) {
        if let TextID = TextFieldId.text,
           let TextPW = TextFieldId.text {
            if TextID.count < 1 || TextPW.count < 1 {
                print("아이디나 비밀번호가 너무 짧습니다 :(")
                return;
            }
        
            Auth.auth().createUser(withEmail: TextID, password: TextPW) {
                //후행 클로져
                authResult, error in
                guard let user = authResult?.user,
                      error == nil else {
                    print(error?.localizedDescription)
                    return
                }
                
                //회원가입 성공
                print("회원가입 성공 :)")
                print("회원정보: ID: \(String(describing: user.email)), uid: \(user.uid)")
            }
        } else {
            print("아이디나 암호가 없습니다 :(")
        }
    }
}

