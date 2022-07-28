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

struct Notice {
    var Header: String?
    var Title: String?
}

let gotToken = UserDefaults.standard.string(forKey: "TokenToken")

class noticeboardVC: UIViewController {
    
    var notice: [Notice] = []
    
    private var Header = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 50)
        $0.text = "게시판"
    }
    
    private var TableView = UITableView().then {
        $0.backgroundColor = UIColor(named: "BackgroundColor")
        $0.rowHeight = 250
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "BackgroundColor")
        
        getNotice()
        attribute()
        layer()
        
    }
    
    func attribute() {
            TableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.cellId)
            TableView.delegate = self
            TableView.dataSource = self
        }
    func layer() {
        [TableView, Header].forEach({view.addSubview($0)})
        
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
    func getNotice() {
        print("불러온 토큰은 : \(gotToken ?? "")")
        let url = "http://54.180.122.62:8080/user/noticeBoard"
        AF.request(url,
                   method: .get,
                   encoding: URLEncoding.queryString,
                   headers: ["Authorization": (getToken ?? "")]
        )
        .validate(statusCode: 200..<300)
        .response { result in
            do{
                let model = try JSONDecoder().decode(Noticeboard.self, from: result.data!)
                
                print("success")
                for i in 0...model.count {
                    self.notice.append(
                        contentsOf:[Notice(Header: model[i].title, Title: model[i].contents)]
                    )
                }
            } catch {
                print(error)
                print("에런데용 :( ?")
            }
        }
    }
}
extension noticeboardVC:  UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notice.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.cellId, for: indexPath) as! TableViewCell
        
//        cell.profile.image = user[indexPath.row].profile
//        cell.name.text = user[indexPath.row].name
        cell.Header.text = notice[indexPath.row].Header
        cell.Title.text = notice[indexPath.row].Title
        cell.selectionStyle = .none
        
        return cell
    }
}
