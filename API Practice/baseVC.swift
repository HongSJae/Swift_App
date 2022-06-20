//
//  baseVC.swift
//  API Practice
//
//  Created by 홍승재 on 2022/06/20.
//

import UIKit

class BaseVC: UIViewController {
    
    var vcTitle: String = "" {
        didSet {
            print("UserListVC - vcTitle didSet() called / vcTitle : \(vcTitle)")
            self.title = vcTitle
        }
    }
}
