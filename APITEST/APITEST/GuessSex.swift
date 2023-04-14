//
//  ViewController.swift
//  APITEST
//
//  Created by 홍승재 on 2022/07/03.
//

import UIKit
import Alamofire

class GuessSexVC: UIViewController {
    
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var SexLabel: UILabel!
    @IBOutlet weak var PersentLabel: UILabel!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

//    @IBAction func RandomFactBtn(_ sender: UIButton) {
//        AF.request(
//            "https://evening-citadel-85778.herokuapp.com:443/randomfact/",
//            method: .get
//        )
//        .validate(statusCode: 200..<300)
//        .response { result in
//            let model = try! JSONDecoder().decode(RandomFactResponse.self, from: result.data!)
//            print(model.results.first!.text)
//            self.textField.text = model.results.first!.text
//        }
//    }
    @IBAction func goGuessButton(_ sender: UIButton) {
        let AC = NameTextField.text!
        NameTextField.text = ""
        getTest(WhoName: AC)
    }
   
    func getTest(WhoName: String) {
        let url = "https://api.genderize.io"
        AF.request(url,
                   method: .get,
                   parameters: ["name": WhoName],
                   encoding: URLEncoding.queryString,
                   headers: ["Content-Type":"application/json", "Accept":"application/json"])
        .validate(statusCode: 200..<300)
        .response { result in
            do{
                let model = try JSONDecoder().decode(GuessSex.self, from: result.data!)
                self.SexLabel.text = model.gender
                self.NameLabel.text = model.name
                self.PersentLabel.text = self.removePoint(num: (model.probability) * 100) + "%"
            } catch {
                print(error)
                self.AlertFunc(title: "오류!", message: "영어로 제대로된 이름을 입력해주세요!")
            }
        }
    }
    
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
    
    func removePoint(num: Double) -> String{
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



