//
//  ViewController.swift
//  CMD
//
//  Created by 홍승재 on 2022/06/30.
//

import UIKit
import SnapKit

class SignupVC: UIViewController {
    @IBOutlet weak var CMDLogo: UIImageView!
    @IBOutlet weak var NameView: UIView!
    @IBOutlet weak var idView: UIView!
    @IBOutlet weak var pwView: UIView!
    @IBOutlet weak var pwCheckView: UIView!
    @IBOutlet weak var CodeView: UIView!
    @IBOutlet weak var SignupBtn: UIButton!
    @IBOutlet weak var gotoLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = true //네비게이션바 숨기기
        
        NameView.layer.cornerRadius = 10
        idView.layer.cornerRadius = 10
        pwView.layer.cornerRadius = 10
        pwCheckView.layer.cornerRadius = 10
        CodeView.layer.cornerRadius = 10
        SignupBtn.layer.cornerRadius = 20
    }
    @IBAction func gotoLoginBtn(_ sender: UIButton) {
        //네비게이션 뷰 컨트롤러를 팝한다
        self.navigationController?.popViewController(animated: true)
    }
    

}

