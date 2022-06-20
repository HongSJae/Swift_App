//
//  ViewController.swift
//  API Practice
//
//  Created by 홍승재 on 2022/06/20.
//

import UIKit

class HomeVC: UIViewController, UISearchBarDelegate, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var searchFilterSegment: UISegmentedControl!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var searchIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var searchButton: UIButton!
    
    var keyboardDismissTabGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: nil)
    
    func showToast(message : String, font: UIFont = UIFont.systemFont(ofSize: 14.0)) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 102, y: self.view.frame.size.height-530, width: 200, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 3.0, delay: 0.1, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }

    //MARK: - override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("HomeVC - viewDidLoad() called")
        
        //ui설정
        self.config()
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
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillhideHandle(notification:)), name: UIResponder.keyboardDidHideNotification, object: nil)
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
        
        self.searchBar.becomeFirstResponder() //포커싱 주기
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
        
        //화면이동
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
        
        //화면으로 이동
        pushVC()
        
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
            self.showToast(message: "📢 검색키워드를 입력해주세요 .")
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
            self.showToast(message: "📢 12자 까지만 입력가능합니다.")
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

