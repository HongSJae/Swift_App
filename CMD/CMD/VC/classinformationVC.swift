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

//MARK: - 전역 변수 선언 (Number, token)

var getNumber: String = ""
var takeToken = UserDefaults.standard.string(forKey: "TokenToken")

class classinformationVC: UIViewController {
    
    //MARK: - 뷰 생성
    
    //취소 버튼
    private var Cancel = UIButton().then {
        $0.setImage(UIImage(named: "X"), for: .normal)
    }
    
    //콘탠트 뷰
    private var ContentView = UIView().then {
        $0.backgroundColor = UIColor(named: "Classinfo")
        $0.layer.cornerRadius = 20
    }
    
    //스크롤 뷰
    private var scrollview = UIScrollView().then {
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
        
        //번호 불러오기
        getNumber = UserDefaults.standard.string(forKey: "Number")!
        
        //API
        ClassAPI(Number: getNumber)
        
        //뷰 선언
        [scrollview].forEach({view.addSubview($0)})
        [ContentView].forEach({scrollview.addSubview($0)})
        [profile, profilename, View, Header, nameinfotitle, nameinfo, birthinfotitle, birthinfo, fieldinfotitle, fieldinfo, numberinfotitle, numberinfo, Cancel].forEach({ContentView.addSubview($0)})

        layout()
        setButton()
        
    }
    
    //MARK: - 버튼 액션 설정
    
    @objc fileprivate func CancelBtn() {
        self.dismiss(animated: true)
    }
    
    //MARK: - 학생정보 불러오기 함수
    
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
    
    //MARK: - 레이아웃 설정 함수
    
    func layout() {
        
        //스크롤뷰 레이아웃
        scrollview.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.top.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(0)
            $0.width.equalToSuperview().inset(30)
        }
        //콘탠트뷰 레이아웃
        ContentView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.top.equalToSuperview().inset(0)
            $0.bottom.equalToSuperview().inset(0)
            $0.width.equalToSuperview().inset(0)
        }
        //취소버튼 레이아웃
        Cancel.snp.makeConstraints {
            $0.height.width.equalTo(16)
            $0.top.equalTo(ContentView.snp.top).inset(20)
            $0.right.equalTo(ContentView.snp.right).inset(20)
        }
        
        //프로필 사진 레이아웃
        profile.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(46)
            $0.height.width.equalTo(view.safeAreaLayoutGuide.snp.width).dividedBy(5)
        }
        //프로필 이름 레이아웃
        profilename.snp.makeConstraints {
            $0.top.equalTo(profile.snp.bottom).offset(5)
            $0.leftMargin.equalTo(profile.snp.leftMargin)
            $0.centerX.equalTo(profile)
        }
        //support View 레이아웃
        View.snp.makeConstraints {
            $0.left.equalToSuperview().offset(10)
            $0.right.equalTo(profile.snp.left).offset(0)
        }
        
        //헤더 레이아웃
        Header.snp.makeConstraints {
            $0.top.equalTo(profilename.snp.bottom).offset(40)
            $0.centerX.equalTo(View)
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
    
    //MARK: - 버튼 액션 실행 함수
    
    func setButton() {
        Cancel.addTarget(self, action: #selector(CancelBtn), for: .touchUpInside)
    }
}
