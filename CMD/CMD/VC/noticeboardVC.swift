//
//  ViewController.swift
//  CMD
//
//  Created by 홍승재 on 2022/06/30.
//

import UIKit
import Alamofire
import Then
import SnapKit

class noticeboardVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var Header = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 50)
        $0.text = "게시판"
    }
    
    private var TableView = UITableView().then {
        $0.backgroundColor = UIColor(named: "BackgroundColor")
    }
    private var TableViewCell = UITableViewCell().then {
        $0.backgroundColor = UIColor(named: "BackgroundColor")
        
    }
    private var Text = UILabel().then {
        $0.textColor = .black
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 17)
        $0.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "BackgroundColor")
        
        TableView.delegate = self
        TableView.dataSource = self
        
        [TableView, Header].forEach({view.addSubview($0)})
        [TableViewCell].forEach({TableView.addSubview($0)})
        
        Header.snp.makeConstraints() {
            $0.leftMargin.equalTo(30)
            $0.topMargin.equalTo(48)
        }
        
        TableView.snp.makeConstraints {
            $0.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(0)
            $0.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(0)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(0)
            $0.top.equalTo(Header.snp.bottom).offset(50)
//            $0.height.equalTo(200)
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10 //몇 개?
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell") as UITableViewCell
        cell.textLabel?.text = ("\(indexPath.row)")
        return cell
    }


}

