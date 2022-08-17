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

class myinfoVC: UIViewController {

    //MARK: - 뷰 생성
    
    private var BigHeader = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 60)
        $0.text = "내 정보"
    }
    
    //콘탠트 뷰
    private var ContentView = UIView().then {
        $0.backgroundColor = UIColor(named: "Classinfo")
        $0.layer.cornerRadius = 20
    }
    
    //프로필 사진
    private var profile = UIImageView().then {
        $0.image = UIImage(named: "Profile")
    }
    //학생 이름
    private var profilename = UILabel().then {
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 26)
        $0.text = "이름"
        $0.textColor = .white
    }
    //support View
    private var View = UIView()
    
    //프로필 헤더
    private var Header = UILabel().then {
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 20)
        $0.text = "회원 정보"
        $0.textColor = .white
    }
    //자리 배치 헤더
    private var Header2 = UILabel().then {
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 20)
        $0.text = "자리 배치"
        $0.textColor = .white
    }
    
    //이름
    private var nameinfotitle = UILabel().then {
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 13)
        $0.text = "이름"
        $0.textColor = .white
    }
    //이름 정보
    private var nameinfo = UILabel().then {
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 14)
        $0.text = "정보없음"
        $0.textColor = .white
    }
    
    //번호
    private var numberinfotitle = UILabel().then {
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 13)
        $0.text = "학번"
        $0.textColor = .white
    }
    //번호 정보
    private var numberinfo = UILabel().then {
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 14)
        $0.text = "정보없음"
        $0.textColor = .white
    }
    
    //생일
    private var birthinfotitle = UILabel().then {
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 13)
        $0.text = "생년월일"
        $0.textColor = .white
    }
    //생일정보
    private var birthinfo = UILabel().then {
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 14)
        $0.text = "정보없음"
        $0.textColor = .white
    }
    
    //전공
    private var fieldinfotitle = UILabel().then {
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 13)
        $0.text = "전공 분야"
        $0.textColor = .white
    }
    //전공 정보
    private var fieldinfo = UILabel().then {
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 14)
        $0.text = "정보없음"
        $0.textColor = .white
    }
    
    //MARK: - 뷰 실행 시
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(named: "BackgroundColor")
        
        //번호 불러오기
        getNumber = UserDefaults.standard.string(forKey: "Number")!
        
        //API
        
        
        //뷰 선언
        [BigHeader, profile, profilename, ContentView].forEach({view.addSubview($0)})
        [View, Header, nameinfotitle, nameinfo, birthinfotitle, birthinfo, fieldinfotitle, fieldinfo, numberinfotitle, numberinfo].forEach({ContentView.addSubview($0)})
        layout()
        
    }
    
    //MARK: - 학생정보 불러오기 함수
    
    
    //MARK: - 레이아웃 설정 함수
    
    func layout() {
        
        BigHeader.snp.makeConstraints {
            $0.topMargin.equalTo(38)
            $0.leadingMargin.equalTo(50)
        }
        //콘탠트뷰 레이아웃
        ContentView.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview().inset(40)
            $0.top.equalTo(profile.snp.bottom).offset(30)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-50)
        }
        
        //프로필 사진 레이아웃
        profile.snp.makeConstraints {
            $0.leftMargin.equalTo(30)
            $0.top.equalTo(BigHeader.snp.bottom).offset(30)
            $0.height.width.equalTo(60)
        }
        //프로필 이름 레이아웃
        profilename.snp.makeConstraints {
            $0.left.equalTo(profile.snp.right).offset(10)
            $0.centerY.equalTo(profile)
        }
        //support View 레이아웃
        View.snp.makeConstraints {
            $0.left.equalToSuperview().offset(10)
            $0.right.equalTo(BigHeader.snp.left).offset(0)
        }
        
        //헤더 레이아웃
        Header.snp.makeConstraints {
            $0.top.equalTo(ContentView.snp.top).offset(30)
            $0.left.equalToSuperview().offset(30)
        }
        
        //이름 레이아웃
        nameinfotitle.snp.makeConstraints {
            $0.leftMargin.equalTo(Header.snp.leftMargin)
            $0.top.equalTo(Header.snp.bottom).offset(20)
        }
        //이름 정보 레이아웃
        nameinfo.snp.makeConstraints {
            $0.centerY.equalTo(nameinfotitle)
            $0.left.equalTo(Header.snp.right).offset(4)
        }
        
        //번호 레이아웃
        numberinfotitle.snp.makeConstraints {
            $0.leftMargin.equalTo(Header.snp.leftMargin)
            $0.top.equalTo(nameinfotitle.snp.bottom).offset(15)
        }
        //번호 정보 레이아웃
        numberinfo.snp.makeConstraints {
            $0.centerY.equalTo(numberinfotitle)
            $0.left.equalTo(Header.snp.right).offset(4)
        }
        
        //생일 레이아웃
        birthinfotitle.snp.makeConstraints {
            $0.leftMargin.equalTo(Header.snp.leftMargin)
            $0.top.equalTo(numberinfotitle.snp.bottom).offset(15)
        }
        //생일 정보 레이아웃
        birthinfo.snp.makeConstraints {
            $0.centerY.equalTo(birthinfotitle)
            $0.left.equalTo(Header.snp.right).offset(4)
        }
        
        //전공 레이아웃
        fieldinfotitle.snp.makeConstraints {
            $0.leftMargin.equalTo(Header.snp.leftMargin)
            $0.top.equalTo(birthinfotitle.snp.bottom).offset(15)
        }
        //전공 정보 레이아웃
        fieldinfo.snp.makeConstraints {
            $0.centerY.equalTo(fieldinfotitle)
            $0.left.equalTo(Header.snp.right).offset(4)
        }
    }
    
}

