//
//  ViewController.swift
//  UpDownGame
//
//  Created by 홍승재 on 2022/06/05.
//

import UIKit
class ViewController: UIViewController {
    @IBOutlet weak var ValueLabel: UILabel!
    @IBOutlet weak var UpOrDown: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    var LandomNum: Int = Int.random(in: 0...100)
    @IBAction func explain(_ sender: UIButton) {
        let alert = UIAlertController(title: "게임 설명", message:
        "랜덤으로 숫자 하나가 지정됩니다.\n키패드로 숫자를 입력하여 맞춰보세요", preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    @IBAction func InputNumButton(_ sender: UIButton) {
        print(LandomNum)
        if sender.tag < 10 {
            if ValueLabel.text == "0" {
                ValueLabel.text = String(sender.tag)
            } else {
                ValueLabel.text = ValueLabel.text! + String(sender.tag)
            }
        }
    }
    @IBAction func InputFuncButton(_ sender: UIButton) {
        if sender.tag == 1 {
            if ValueLabel.text! > String(LandomNum) {
                UpOrDown.text = "Down!"
                ValueLabel.text = "0"
            }else if ValueLabel.text! < String(LandomNum) {
                UpOrDown.text = "Up!"
                ValueLabel.text = "0"
            } else {
                UpOrDown.text = ""
                ValueLabel.text = "0"
                let alert = UIAlertController(title: "성공", message:
                "다시 시작하시겠습니까?", preferredStyle: .alert)
                let action = UIAlertAction(title: "예", style: .default, handler: nil)
                alert.addAction(action)
                present(alert, animated: true, completion: nil)
                LandomNum = Int.random(in: 0...100)
            }
        } else {
            ValueLabel.text!.removeLast()
        }
    }
}
