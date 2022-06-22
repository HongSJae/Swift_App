//
//  baseVC.swift
//  API Practice
//
//  Created by 홍승재 on 2022/06/20.
//

import UIKit
import Toast_Swift

class BaseVC: UIViewController {
    
    var vcTitle: String = "" {
        didSet {
            print("UserListVC - vcTitle didSet() called / vcTitle : \(vcTitle)")
            self.title = vcTitle
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //인증 실패 노티피케이션 등록
        NotificationCenter.default.addObserver(self, selector: #selector(showErrorPopup(notification:)), name: NSNotification.Name(rawValue: NOTIFICATION.API.AUTH_FAIL), object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //인증 실패 노티피케이션 등록 해제
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: NOTIFICATION.API.AUTH_FAIL), object: nil)
    }
    
    //MARK: = objc methods
    
    @objc func showErrorPopup(notification: NSNotification) {
        print("BaseVc - showErrorPopup()")
        
        if let data = notification.userInfo?["statusCode"] {
            print("showErrorPopup() data: \(data)")
            
            
            //메인쓰레드에서 돌리기 즉 UI 쓰레드
            DispatchQueue.main.async {
                self.view.makeToast("☠️ \(data) 에러 입니다", duration: 1.0, position: .center)
            }
        }
    }
}
