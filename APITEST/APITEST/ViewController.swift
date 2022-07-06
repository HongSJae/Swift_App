//
//  ViewController.swift
//  APITEST
//
//  Created by 홍승재 on 2022/07/03.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func RandomFactBtn(_ sender: UIButton) {
        AF.request(
            "https://evening-citadel-85778.herokuapp.com:443/randomfact/",
            method: .get
        )
        .validate(statusCode: 200..<300)
        .response { result in
            let model = try! JSONDecoder().decode(RandomFactResponse.self, from: result.data!)
            print(model.results.first!.text)
            self.textField.text = model.results.first!.text
        }
    } 
    
}



