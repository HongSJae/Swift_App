//
//  ViewController.swift
//  CMD
//
//  Created by 홍승재 on 2022/06/30.
//

import UIKit
import SnapKit

class LoginVC: UIViewController {
    @IBOutlet weak var CMDLogo: UIImageView!
    @IBOutlet weak var idFrame: UIView!
    @IBOutlet weak var pwFrame: UIView!
    @IBOutlet weak var LoginBtn: UIButton!
    @IBOutlet weak var gotoSignUpBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        idFrame.layer.cornerRadius = 10
        pwFrame.layer.cornerRadius = 10
        LoginBtn.layer.cornerRadius = 20
    }


}

