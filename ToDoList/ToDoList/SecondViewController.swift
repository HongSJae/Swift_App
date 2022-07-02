//
//  SecondUIViewController.swift
//  ToDoList
//
//  Created by 홍승재 on 2022/06/10.
//  길근우 왔다감 ㅎ

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var Inputtext: UITextField!
    @IBOutlet weak var OKBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var TDLcontents: String = ""
    @IBAction func MakeList(_ sender: UIButton) {
        TDLcontents = Inputtext.text!
        Inputtext.text = ""

        
        //네비게이션 뷰 컨트롤러를 팝한다
        self.navigationController?.popViewController(animated: true)
    }
}

