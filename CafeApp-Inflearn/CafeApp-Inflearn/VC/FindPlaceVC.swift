//
//  FindPlaceVC.swift
//  CafeApp-Inflearn
//
//  Created by 홍승재 on 2022/07/08.
//

import UIKit
import WebKit

class FindPlaceVC: UIViewController {
    @IBOutlet weak var WebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //네비게이션 바를 숨김
        self.navigationController?.navigationBar.isHidden = false
        
        loadWebPage("https://paikdabang.com/store/")
    }
    
    func loadWebPage(_ url: String) {
        let MyURL = URL(string: url)
        let MyRequest = URLRequest(url: MyURL!)
        
        WebView.load(MyRequest)
    }

}
