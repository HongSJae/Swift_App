//
//  SecondViewController.swift
//  ToDoListAgain
//
//  Created by 홍승재 on 2022/07/05.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var TitleTextField: UITextField!
    @IBOutlet weak var ContentTextView: UITextView!
    
    @IBAction func CancelBtn(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func DoneBtn(_ sender: UIBarButtonItem) {
        if TitleTextField.text == "" && ContentTextView.text == "" {
            AlertFunc(title: "빈칸이 있습니다!", message: "제목과 내용을 입력해주세요.")
        } else if TitleTextField.text == "" {
            AlertFunc(title: "제목을 안적으셨네요", message: "제목을 입력해주세요.")
        } else if ContentTextView.text == "" {
            AlertFunc(title: "내용을 안적으셨네요", message: "내용을 입력해주세요.")
        } else {
            let title = TitleTextField.text!
            let content = ContentTextView.text!
            let item: ToDoList = ToDoList(ToDoTitle: title, ToDoText: content)
            TDL.append(item)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
}
