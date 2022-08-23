//
//  NoticeboardVCViewController.swift
//  CMD
//
//  Created by 홍승재 on 2022/06/30.
//

import UIKit
import Alamofire
import Then
import SnapKit
import ViewAnimator
import SwiftUI

//MARK: - 전역 변수 선언 (Number, token)

struct Notice {
    var Header: String
    var Title: String
}

class noticeboardVC: UIViewController {
    
    //MARK: - 뷰 생성
    
    var notice: [Notice] = []
    var tempArray: [Notice] = []
    
    private let animations = [AnimationType.vector(CGVector(dx: 0, dy: 50))]
    
    private var Header = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 50)
        $0.text = "게시판"
    }
    
    private var TableView = UITableView().then {
        $0.backgroundColor = UIColor(named: "BackgroundColor")
        $0.rowHeight = 250
    }
    
    //MARK: - 뷰 실행 시
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "BackgroundColor")
        
        [TableView, Header].forEach({view.addSubview($0)})
        
        //API
        getNotice()
        
        token = UserDefaults.standard.string(forKey: "token")!
        layout()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.getNotice()
    }
    
    //MARK: - 테이블 뷰 설정 함수
    
    func attribute() {
        TableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.cellId)
        TableView.delegate = self
        TableView.dataSource = self
        
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .white
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        self.TableView.refreshControl = refreshControl
        
        self.TableView.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            [weak self] in
            guard let self = self else { return }
            self.tempArray = self.notice
            self.TableView.reloadData()
            //애니메이션
            UIView.animate(views: self.TableView.visibleCells, animations: self.animations)
        })
    }
    
    //MARK: - 레이아웃 설정 함수
    
    func layout() {
        
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
    
    //MARK: - 공지사항 받는 함수
    
    func getNotice() {
        print("불러온 토큰은 : \(token)")
        let url = "http://54.180.122.62:8080/user/noticeBoard"
        AF.request(url,
                   method: .get,
                   encoding: URLEncoding.queryString,
                   headers: ["Authorization": (token )]
        )
        .validate(statusCode: 200..<300)
        .response { result in
            do{
                let model = try JSONDecoder().decode(Noticeboard.self, from: result.data!)
                
                print("success")
                self.notice.removeAll()
                if model.count == 0 {
                    self.notice.append(
                        contentsOf:[Notice(Header: "게시물이 없어요",
                                           Title: "추가된 게시물이 없습니다.")]
                    )
                } else {
                    for i in 0..<model.count {
                        self.notice.append(
                            contentsOf:[Notice(Header: model[i].title, Title: model[i].contents)]
                        )
                    }
                }
                print("API: \(self.notice)")
                
                self.attribute()
            } catch {
                print(error)
                print("에런데용 :( ?")
            }
        }
    }
    
    @objc fileprivate func handleRefresh(sender: AnyObject) {
        print("tableView Reload")
        
        //기존 데이터 지우기
        self.tempArray.removeAll()
        
        //사라지는 애니메이션 추가
        UIView.animate(views: self.TableView.visibleCells,
                       animations: self.animations,
                       reversed: false,
                       initialAlpha: 1, //보이다가
                       finalAlpha: 0,  //안보이게
                       completion: {
            self.TableView.reloadData()
        })
        
        self.TableView.refreshControl?.endRefreshing()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            [weak self] in
            guard let self = self else { return }
            self.getNotice()
            self.tempArray = self.notice
            self.TableView.reloadData()
            UIView.animate(views: self.TableView.visibleCells,
                           animations: self.animations,
                           reversed: false,
                           initialAlpha: 0,
                           finalAlpha: 1,
                           completion: nil)
        })
    }
}

extension noticeboardVC:  UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.cellId, for: indexPath) as! TableViewCell
        
        if tempArray.count > 0 {
            cell.Header.text = tempArray[indexPath.row].Header
            cell.Title.text = tempArray[indexPath.row].Title
        }
        
        cell.selectionStyle = .none
        
        return cell
    }
}
