//
//  ListViewController.swift
//  FireBase-Inflearn
//
//  Created by 홍승재 on 2022/07/08.
//

import UIKit
import Firebase
import FirebaseFirestore

class ListViewController: UIViewController {
    
    @IBOutlet weak var TextVIew: UITextView!
    
    struct IdolData {
        var name: String
        var imageString: String
        //FireBase DB에 들어가는 Data 구조
        //class, struct가 들어갈 수 없음
        /*
         1. Number
         2. String
         3. Array
         4. Dictionary
         */
        func getDictionary() -> [String: String] {
            let Dictionary = ["name": self.name,
                              "inageString": self.imageString]
            return Dictionary
        }
    }
    
    //구초제 배열
    var IdolArray: [IdolData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onBtnADDlist(_ sender: UIButton) {
        var idol = IdolData(name: "태연", imageString: "image3.png")
        //DB에 접근하면서 Dictionary로 변환
        let idolDictionary = idol.getDictionary()
        //DB연동
        let db = Firestore.firestore()
        
        var ref: DocumentReference? = nil
        ref = db.collection("idols").addDocument(data: idolDictionary) {
            //후행 클로저
            err in
            if let error = err {
                print("쓰기 에러 발생", error)
                self.TextVIew.text.append("\n쓰기 에러 발생 :(")
            } else {
                print("Document 쓰기 성공")
                print("Document ID: ", ref!.documentID)
                self.TextVIew.text.append("\n도큐먼트 쓰기 성공 :)")
            }
        }
    }
    
    @IBAction func onBtnREADlist(_ sender: UIButton) {
        readListData()
    }
    func readListData() {
        let db = Firestore.firestore()
        
        db.collection("idols").whereField("name", isEqualTo: "수지").getDocuments() {
            //후행 클로저
            (QuerySnapshot, err) in
            if let error = err {
                print("읽기 에러 발생 :(", error.localizedDescription)
                self.TextVIew.text.append("\n읽기 오류 발생 :(")
            } else {
                for document in QuerySnapshot!.documents {
                    print("\(document.documentID)->\(document.data())")
                    
                    let dataDictionary = document.data() as NSDictionary
                    let name = dataDictionary["name"] as? String ?? "이름없음"
                    let imageString = dataDictionary["imageString"] as? String ?? "이미지 없음"
                    
                    //구조체로 값을 넣어줌
                    var idol = IdolData(name: name, imageString: imageString)
                    self.IdolArray.append( idol )
                }
                for idol in self.IdolArray {
                    self.TextVIew.text.append("\n\(idol.name)")
                    self.TextVIew.text.append("\n\(idol.imageString)")
                }
            }
        }
    }
 
}
