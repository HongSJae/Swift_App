//
//  classinformationVC.swift
//  CMD
//
//  Created by 홍승재 on 2022/07/26.
//

import UIKit
import Alamofire
import Then
import SnapKit

var getNumber: String = ""
let takeToken = UserDefaults.standard.string(forKey: "TokenToken")

class classinformationVC: UIViewController {
    
    private var Cancel = UIButton().then {
        $0.setImage(UIImage(named: "X"), for: .normal)
    }
    
    private var ContentView = UIView().then {
        $0.backgroundColor = UIColor(named: "Classinfo")
        $0.layer.cornerRadius = 20
    }
    
    private var scrollview = UIScrollView().then {
        $0.layer.cornerRadius = 20
    }
    
    private var profile = UIImageView().then {
        $0.image = UIImage(named: "Profile")
    }
    private var profilename = UILabel().then {
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 26)
        $0.text = "이름"
        $0.textColor = .white
    }
    private var View = UIView()
    
    private var Header = UILabel().then {
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 20)
        $0.text = "회원 정보"
        $0.textColor = .white
    }
    private var Header2 = UILabel().then {
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 20)
        $0.text = "자리 배치"
        $0.textColor = .white
    }
    
    private var nameinfotitle = UILabel().then {
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 13)
        $0.text = "이름"
        $0.textColor = .white
    }
    private var nameinfo = UILabel().then {
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 14)
        $0.text = "정보없음"
        $0.textColor = .white
    }
    
    private var numberinfotitle = UILabel().then {
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 13)
        $0.text = "학번"
        $0.textColor = .white
    }
    private var numberinfo = UILabel().then {
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 14)
        $0.text = "정보없음"
        $0.textColor = .white
    }
    
    private var birthinfotitle = UILabel().then {
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 13)
        $0.text = "생년월일"
        $0.textColor = .white
    }
    private var birthinfo = UILabel().then {
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 14)
        $0.text = "정보없음"
        $0.textColor = .white
    }
    
    private var fieldinfotitle = UILabel().then {
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 13)
        $0.text = "전공 분야"
        $0.textColor = .white
    }
    private var fieldinfo = UILabel().then {
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 14)
        $0.text = "정보없음"
        $0.textColor = .white
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getNumber = UserDefaults.standard.string(forKey: "Number")!
        ClassAPI(Number: getNumber)
        view.addSubview(scrollview)
        scrollview.addSubview(ContentView)
        [profile, profilename, View, Header, nameinfotitle, nameinfo, birthinfotitle, birthinfo, fieldinfotitle, fieldinfo, numberinfotitle, numberinfo, Cancel].forEach({ContentView.addSubview($0)})

        scrollview.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.top.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(0)
            $0.width.equalToSuperview().inset(30)
        }
        ContentView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.top.equalToSuperview().inset(0)
            $0.bottom.equalToSuperview().inset(0)
            $0.width.equalToSuperview().inset(0)
        }
        Cancel.snp.makeConstraints {
            $0.height.width.equalTo(16)
            $0.top.equalTo(ContentView.snp.top).inset(20)
            $0.right.equalTo(ContentView.snp.right).inset(20)
        }
        
        profile.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(46)
            $0.height.width.equalTo(view.safeAreaLayoutGuide.snp.width).dividedBy(5)
        }
        profilename.snp.makeConstraints {
            $0.top.equalTo(profile.snp.bottom).offset(5)
            $0.leftMargin.equalTo(profile.snp.leftMargin)
            $0.centerX.equalTo(profile)
        }
        View.snp.makeConstraints {
            $0.left.equalToSuperview().offset(10)
            $0.right.equalTo(profile.snp.left).offset(0)
        }
        
        Header.snp.makeConstraints {
            $0.top.equalTo(profilename.snp.bottom).offset(40)
            $0.centerX.equalTo(View)
        }
        
        nameinfotitle.snp.makeConstraints {
            $0.leftMargin.equalTo(Header.snp.leftMargin)
            $0.top.equalTo(Header.snp.bottom).offset(20)
        }
        nameinfo.snp.makeConstraints {
            $0.centerY.equalTo(nameinfotitle)
            $0.left.equalTo(Header.snp.right).offset(4)
        }
        
        numberinfotitle.snp.makeConstraints {
            $0.leftMargin.equalTo(Header.snp.leftMargin)
            $0.top.equalTo(nameinfotitle.snp.bottom).offset(15)
        }
        numberinfo.snp.makeConstraints {
            $0.centerY.equalTo(numberinfotitle)
            $0.left.equalTo(Header.snp.right).offset(4)
        }
        
        birthinfotitle.snp.makeConstraints {
            $0.leftMargin.equalTo(Header.snp.leftMargin)
            $0.top.equalTo(numberinfotitle.snp.bottom).offset(15)
        }
        birthinfo.snp.makeConstraints {
            $0.centerY.equalTo(birthinfotitle)
            $0.left.equalTo(Header.snp.right).offset(4)
        }
        
        fieldinfotitle.snp.makeConstraints {
            $0.leftMargin.equalTo(Header.snp.leftMargin)
            $0.top.equalTo(birthinfotitle.snp.bottom).offset(15)
        }
        fieldinfo.snp.makeConstraints {
            $0.centerY.equalTo(fieldinfotitle)
            $0.left.equalTo(Header.snp.right).offset(4)
        }
        Cancel.addTarget(self, action: #selector(CancelBtn), for: .touchUpInside)
    }
    @objc fileprivate func CancelBtn() {
        self.dismiss(animated: true)
    }
    
    
    
    func ClassAPI(Number: String) {
        let url = "http://54.180.122.62:8080/user/info/" + Number
        AF.request(url,
                   method: .get,
                   encoding: URLEncoding.queryString,
                   headers: ["Authorization": (takeToken ?? "")]
        )
        .validate(statusCode: 200..<300)
        .response { result in
            do{
                let model = try JSONDecoder().decode(Classinfo.self, from: result.data!)
                print("success")
                self.profilename.text = model.username ?? "이름"
                self.nameinfo.text = model.username ?? "정보없음"
                self.birthinfo.text = model.birthday ?? "정보없음"
                self.fieldinfo.text = model.field ?? "정보없음"
                self.numberinfo.text = model.number ?? "정보없음"
            } catch {
                print(error)
                print("정보가 없어요")
            }
        }
    }
}
