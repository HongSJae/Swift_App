//
//  ViewController.swift
//  CMD
//
//  Created by 홍승재 on 2022/06/30.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelegate.MainTabBar = self
        self.delegate = self
    }
    
    //탭바 선택시 이벤트 함수 호출
//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        print("selected tabbar index : \(tabBarController.selectedIndex)")
//
//        if tabBarController.selectedIndex == 0 ||
//            tabBarController.selectedIndex == 1 {
//
//        }
//    }
}


