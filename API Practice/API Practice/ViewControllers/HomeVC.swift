//
//  ViewController.swift
//  API Practice
//
//  Created by 홍승재 on 2022/06/20.
//

import UIKit
import Toast_Swift
import Alamofire

class HomeVC: UIViewController, UISearchBarDelegate, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var searchFilterSegment: UISegmentedControl!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var searchIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var searchButton: UIButton!
    
    var keyboardDismissTabGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: nil)
    
    //MARK: - override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("HomeVC - viewDidLoad() called")
        
        //ui설정
        self.config()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("HomeVC - viewDidApear() called")
        self.searchBar.becomeFirstResponder() //포커싱 주기
    }
    //화면이 넘어가기 전에 준비한다
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("HomeVC - prepare() called / segue.identifier : \(segue.identifier)")
        
        switch segue.identifier {
        case SEGUE_ID.USER_LIST_VC:
            //다움화면을 뷰컨트롤러를 가져온다
            let nextVC = segue.destination as! UserListVC
            
            guard let userInputValue = self.searchBar.text else { return }
            
            nextVC.vcTitle = userInputValue + " 👤"
        case SEGUE_ID.PHOTO_COLLECTION_VC:
                  // 다음 화면의 뷰컨트롤러를 가져온다.
            let nextVC = segue.destination as! PhotoCollectionVC
            
            guard let userInputValue = self.searchBar.text else { return }
            
            nextVC.vcTitle = userInputValue + " 🏞"
        default:
            print("default")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("HomeVC - viewWillApear")
        //키보드 올라가는 이벤트를 받는 처리
        //키보드 노티 등록
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillshowHandle(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillhideHandle), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("HomeVC - viewWillDispear")
        //키보드 노티 해제
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    //MARK: - fileprivate methods
    fileprivate func config(){
        //ui설정
        self.searchButton.layer.cornerRadius = 10
        
        self.searchBar.searchBarStyle = .minimal
        
        self.searchBar.delegate = self
        
        self.keyboardDismissTabGesture.delegate = self
        
        //제스처 추가하기
        self.view.addGestureRecognizer(keyboardDismissTabGesture)
    }
    
    fileprivate func pushVC(){
        var segueId: String =  ""
        
        switch searchFilterSegment.selectedSegmentIndex {
        case 0:
            print("사진 화면으로 이동")
            segueId = "GoToPhotoCollectionVC"
        case 1:
            print("사용자 화면으로 이동")
            segueId = "GoToUserListVC"
        default:
            print("defalt")
            segueId = "GoToPhotocollectionVC"
            
        }
        
        //화면이동hello
        self.performSegue(withIdentifier: segueId, sender: self)
    }
    
    @objc func keyboardWillshowHandle(notification: NSNotification) {
        print("HomeVC - keyboardWillshowHandle() called")
        //키보드 사이즈 가져오기
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            print("keyboardSize.height : \(keyboardSize.height)")
            print("searchButton.frame.origin.y : \(searchButton.frame.origin.y)")
            
            if keyboardSize.height < searchButton.frame.origin.y {
                print("키보드가 버튼을 덮었다.")
                let distance = keyboardSize.height - searchButton.frame.origin.y
                print("이 만큼 덮었다. distance : \(distance)")
                self.view.frame.origin.y = distance + searchButton.frame.height
            }
        }
        
        self.view.frame.origin.y = -100
    }
    
    @objc func keyboardWillhideHandle(notification: NSNotification) {
        print("HomeVC - keyboardWillhideHandle() called")
        self.view.frame.origin.y = 0
    }
    
    //MARK: - IBAction methods
    @IBAction func onSearchButtonClicked(_ sender: UIButton) {
        print("HomeVC - searchFilterValueChanged() called / selectedindex = \(searchFilterSegment.selectedSegmentIndex)")
        
//        let url = API.BASE_URL + "search_photos"
//
        guard let userInput = self.searchBar.text else { return }
//
//        // 키, 벨류 형식의 딕셔너리
//        let queryParm = ["query" : userInput, "client_id" : API.CLIENT_ID]
        
//        AF.request(url, method: .get, parameters: queryParm).responseData(completionHandler: { response in debugPrint(response)
//        })
        
        var urlToCall: URLRequestConvertible?
        
        switch searchFilterSegment.selectedSegmentIndex {
        case 0:
            urlToCall = MySearchLouter.searchPhotos(term: userInput)
        case 1:
            urlToCall = MySearchLouter.searchUsers(term: userInput)
        default:
            print("default")
        }
        
        if let urlConvertible = urlToCall {
            MyAlamofireManager
                .shared
                .session
                .request(urlConvertible)
                .validate(statusCode: 200..<401)
                .responseJSON(completionHandler: { response in
    //                debugPrint(response)
                })
        }
    }
    @IBAction func searchFilterValueChaged(_ sender: UISegmentedControl) {
        //print("HomeVC - searchFilterValueChanged() called / index = \(sender.selectedSegmentIndex)")
        
        var searchBarTitle = ""
        switch sender.selectedSegmentIndex {
            
        case 0:
            searchBarTitle = "사진 키워드"
        case 1:
            searchBarTitle = "사용자 이름"
        default:
            searchBarTitle = "사진 키워드"
        }
        
        self.searchBar.placeholder = searchBarTitle + " 입력"
         
        self.searchBar.becomeFirstResponder() // 포커싱 주기
//        self.searchBar.resignFirstResponder() // 포커싱 해재
    }
    
    //MARK: - UISearchBar Delegate methods
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("HomeVC - searchBarSearchButtonClicked()")
        
        guard let userInputString = searchBar.text else { return }
        
        if userInputString.isEmpty {
            self.view.makeToast("📢 검색키워드를 입력해주세요.", duration: 1.0, position: .center)
        } else {
            pushVC()
            searchBar.resignFirstResponder()
        }
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("HomeVC - searchBar textDidChange() sarchText : \(searchText)")
        
        //사용자가 입력한 값이 없을 때
        if (searchText.isEmpty) {
            self.searchButton.isHidden = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01, execute: {
                //포커싱 해제
                searchBar.resignFirstResponder()
            })
            
        } else {
            self.searchButton.isHidden = false
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        let inputTextCount = searchBar.text?.appending(text).count ?? 0
        
        print("shouldChangeTextin : \(inputTextCount)")
        
        if inputTextCount >= 12 {
            self.view.makeToast("📢 12자 까지만 입력가능합니다.", duration: 1.0, position: .center)
        }
        
        if inputTextCount <= 12 {
            return true
        } else {
            return false
        }
        
    }
    //MARK: - UIGestureRecognizerDelegate
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        //print("HomeVC - gestureRecognizer shouldReceive called")
        
        //터치로 들어온 뷰가 요놈이면
        if touch.view?.isDescendant(of: searchFilterSegment) == true {
            print("세그먼트가 터치되었다.")
            return false
        } else if touch.view?.isDescendant(of: searchBar) == true {
            print("서치바가 터치되었다.")
            return false
        } else {
            view.endEditing(true)
            print("화면이 터치되었다.")
            return true
        }
    }
    
    
}

