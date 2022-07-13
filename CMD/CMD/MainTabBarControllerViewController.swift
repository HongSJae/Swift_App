//
//  MainTabBarControllerViewController.swift
//  CMD
//
//  Created by 홍승재 on 2022/07/12.
//

import UIKit

class MainTabBarControllerViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        tabBar.backgroundColor = UIColor(named: "TabBarItemColor")
        UITabBar.appearance().tintColor = .white
        
        let ScheduleNC = UINavigationController.init(rootViewController: scheduleVC())
        let classinfoNC = UINavigationController.init(rootViewController: classinfo())
        let noticeboardNC = UINavigationController.init(rootViewController: noticeboardVC())
        let myinfoNC = UINavigationController.init(rootViewController: myinfoVC())
        
        self.viewControllers = [ScheduleNC, classinfoNC, noticeboardNC, myinfoNC]
        
        let ScheduleTabBarItem = UITabBarItem(title: "시간표", image: UIImage(systemName: "calendar"), tag: 0)
        let classinfoTabBarItem = UITabBarItem(title: "학생정보", image: UIImage(systemName: "info"), tag: 1)
        let noticeboardTabBarItem = UITabBarItem(title: "공지사항", image: UIImage(systemName: "speaker"), tag: 2)
        let myinfoTabBarItem = UITabBarItem(title: "내 정보", image: UIImage(systemName: "person"), tag: 3)
        
        ScheduleNC.tabBarItem = ScheduleTabBarItem
        
        classinfoNC.tabBarItem = classinfoTabBarItem
        noticeboardNC.tabBarItem = noticeboardTabBarItem
        myinfoNC.tabBarItem = myinfoTabBarItem
        
    }
    

}
