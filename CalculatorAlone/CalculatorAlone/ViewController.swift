//
//  ViewController.swift
//  CalculatorAlone
//
//  Created by 홍승재 on 2022/06/06.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ValueLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var FirstNum: Double = 0 //계산할 때 앞에 값
    var SecondNum: Double = 0 //계산할 때 뒤에 값
    var typeNum: Int = 0 //무슨 연산을 할지
    var Avility: Bool = true //ValueLabel에 있는 것을 바꿀 수 있다 = true, 없다 = false
    var Continuity: Bool = false //연속계산이면 true 아니면 false
    @IBAction func InputButton(_ sender: UIButton) {
        if sender.tag < 10 {
            if Avility == true {
                ValueLabel.text = String(sender.tag)
                Avility = false
            } else {
                ValueLabel.text = ValueLabel.text! + String(sender.tag)
            }
        } else if sender.tag < 13 {
            switch sender.tag {
            case 10: //AC(초기화)
                ValueLabel.text = "0"
                Avility = true
            case 11: //+/-(양수/음수 변환)
                ValueLabel.text = removePoint(num: (Double(ValueLabel.text!)! * -1))
            case 12: //%(백분율)
                ValueLabel.text = removePoint(num: (Double(ValueLabel.text!)! * 0.01))
            default:
                break
            }
        } else {
            switch sender.tag {
            case 13: //÷(나누기)
                FirstNum = Double(ValueLabel.text!)!
                Avility = true
                typeNum = sender.tag
            case 14: //×(곱하기)
                FirstNum = Double(ValueLabel.text!)!
                Avility = true
                typeNum = sender.tag
            case 15: //-(빼기)
                FirstNum = Double(ValueLabel.text!)!
                Avility = true
                typeNum = sender.tag
            case 16: //+(더하기)
                FirstNum = Double(ValueLabel.text!)!
                Avility = true
                typeNum = sender.tag
            case 17: //=(결과)
                Avility = true
                SecondNum = Double(ValueLabel.text!)!
                switch typeNum {
                case 13: //나누기
                    if SecondNum == 0 {
                        ValueLabel.text = "오류"
                    } else {
                        ValueLabel.text = removePoint(num: FirstNum / SecondNum)
                    }
                case 14: //곱하기
                    ValueLabel.text = removePoint(num: FirstNum * SecondNum)
                case 15: //빼기
                    ValueLabel.text = removePoint(num: FirstNum - SecondNum)
                case 16: //더하기
                    ValueLabel.text = removePoint(num: FirstNum + SecondNum)
                default:
                    break
                }
            default:
                break
            }
        }
    }
    func removePoint(num: Double) -> String{ //구글링, 근데 이해됨
            var floatNumString = String(num)
                
            while floatNumString.last == "0" {
                floatNumString.removeLast()
            }
            if floatNumString.last == "."{
                floatNumString.removeLast()
            }
            return floatNumString
        }
}

