//
//  classinfoViewController.swift
//  CMD
//
//  Created by 홍승재 on 2022/06/30.
//

import UIKit
import Alamofire
import Then
import SnapKit

class classinfo: UIViewController {
    
    //MARK: - 뷰 생성
    
    //헤더
    private var Header = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 50)
        $0.text = "학생정보"
    }
    
    //1번
    private var NO1 = UIButton().then {
        $0.setImage(UIImage(named: "Profile"), for: .normal)
    }
    private var Name1 = UILabel().then {
        $0.text = "강용수"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    //2번
    private var NO2 = UIButton().then {
        $0.setImage(UIImage(named: "Profile"), for: .normal)
    }
    private var Name2 = UILabel().then {
        $0.text = "강지인"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    //3번
    private var NO3 = UIButton().then {
        $0.setImage(UIImage(named: "Profile"), for: .normal)
    }
    private var Name3 = UILabel().then {
        $0.text = "길근우"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    //4번
    private var NO4 = UIButton().then {
        $0.setImage(UIImage(named: "Profile"), for: .normal)
    }
    private var Name4 = UILabel().then {
        $0.text = "김민채"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    //5번
    private var NO5 = UIButton().then {
        $0.setImage(UIImage(named: "Profile"), for: .normal)
    }
    private var Name5 = UILabel().then {
        $0.text = "김은오"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    //6번
    private var NO6 = UIButton().then {
        $0.setImage(UIImage(named: "Profile"), for: .normal)
    }
    private var Name6 = UILabel().then {
        $0.text = "김정현"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    //7번
    private var NO7 = UIButton().then {
        $0.setImage(UIImage(named: "Profile"), for: .normal)
    }
    private var Name7 = UILabel().then {
        $0.text = "김주원"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    //8번
    private var NO8 = UIButton().then {
        $0.setImage(UIImage(named: "Profile"), for: .normal)
    }
    private var Name8 = UILabel().then {
        $0.text = "김현민"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    //9번
    private var NO9 = UIButton().then {
        $0.setImage(UIImage(named: "Profile"), for: .normal)
    }
    private var Name9 = UILabel().then {
        $0.text = "마재영"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    //10번
    private var NO10 = UIButton().then {
        $0.setImage(UIImage(named: "Profile"), for: .normal)
    }
    private var Name10 = UILabel().then {
        $0.text = "유나현"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    //11번
    private var NO11 = UIButton().then {
        $0.setImage(UIImage(named: "Profile"), for: .normal)
    }
    private var Name11 = UILabel().then {
        $0.text = "유현담"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    //12번
    private var NO12 = UIButton().then {
        $0.setImage(UIImage(named: "Profile"), for: .normal)
    }
    private var Name12 = UILabel().then {
        $0.text = "윤정민?"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    //13번
    private var NO13 = UIButton().then {
        $0.setImage(UIImage(named: "Profile"), for: .normal)
    }
    private var Name13 = UILabel().then {
        $0.text = "정승훈"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    //14번
    private var NO14 = UIButton().then {
        $0.setImage(UIImage(named: "Profile"), for: .normal)
    }
    private var Name14 = UILabel().then {
        $0.text = "정지관"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    //15번
    private var NO15 = UIButton().then {
        $0.setImage(UIImage(named: "Profile"), for: .normal)
    }
    private var Name15 = UILabel().then {
        $0.text = "조문성"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    //16번
    private var NO16 = UIButton().then {
        $0.setImage(UIImage(named: "Profile"), for: .normal)
    }
    private var Name16 = UILabel().then {
        $0.text = "최하은"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    //17번
    private var NO17 = UIButton().then {
        $0.setImage(UIImage(named: "Profile"), for: .normal)
    }
    private var Name17 = UILabel().then {
        $0.text = "한예슬"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    //18번
    private var NO18 = UIButton().then {
        $0.setImage(UIImage(named: "Profile"), for: .normal)
    }
    private var Name18 = UILabel().then {
        $0.text = "홍승재"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    //스크롤 뷰
    private var scrollView = UIScrollView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    //스크롤뷰의 콘텐트뷰
    private var ContentView = UIView()
    
    //MARK: - 뷰 실행 시
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(named: "BackgroundColor")
    
        [Header, scrollView].forEach({view.addSubview($0)})
        [ContentView].forEach({scrollView.addSubview($0)})
        [NO1, Name1, NO2, Name2, NO3, Name3, NO4, Name4, NO5, Name5, NO6, Name6, NO7, Name7, NO8, Name8, NO9, Name9, NO10, Name10, NO11, Name11, NO12, Name12, NO13, Name13, NO14, Name14, NO15, Name15, NO16, Name16, NO17, Name17, NO18, Name18].forEach({ContentView.addSubview($0)})
        
        layout()
        setButton()
        
    }
    
    //MARK: - 버튼 액션 설정

    @objc fileprivate func gotoClassinformation1() {ClassFunc(Number: "1201")}
    @objc fileprivate func gotoClassinformation2() {ClassFunc(Number: "1202")}
    @objc fileprivate func gotoClassinformation3() {ClassFunc(Number: "1203")}
    @objc fileprivate func gotoClassinformation4() {ClassFunc(Number: "1204")}
    @objc fileprivate func gotoClassinformation5() {ClassFunc(Number: "1205")}
    @objc fileprivate func gotoClassinformation6() {ClassFunc(Number: "1206")}
    @objc fileprivate func gotoClassinformation7() {ClassFunc(Number: "1207")}
    @objc fileprivate func gotoClassinformation8() {ClassFunc(Number: "1208")}
    @objc fileprivate func gotoClassinformation9() {ClassFunc(Number: "1209")}
    @objc fileprivate func gotoClassinformation10() {ClassFunc(Number: "1210")}
    @objc fileprivate func gotoClassinformation11() {ClassFunc(Number: "1211")}
    @objc fileprivate func gotoClassinformation12() {ClassFunc(Number: "1212")}
    @objc fileprivate func gotoClassinformation13() {ClassFunc(Number: "1213")}
    @objc fileprivate func gotoClassinformation14() {ClassFunc(Number: "1214")}
    @objc fileprivate func gotoClassinformation15() {ClassFunc(Number: "1215")}
    @objc fileprivate func gotoClassinformation16() {ClassFunc(Number: "1216")}
    @objc fileprivate func gotoClassinformation17() {ClassFunc(Number: "1217")}
    @objc fileprivate func gotoClassinformation18() {ClassFunc(Number: "1218")}
    
    //MARK: - 학생 번호 UserDefaults에 저장하는 함수
    func ClassFunc(Number: String) {
        UserDefaults.standard.set(Number, forKey: "Number")
        self.navigationController?.present(classinformationVC(), animated: true)
    }
    
    //MARK: - 레이아웃 설정 함수
    func layout() {
        Header.snp.makeConstraints() {
            $0.leftMargin.equalTo(30)
            $0.topMargin.equalTo(48)
        }
        
        scrollView.snp.makeConstraints {
            $0.right.left.equalTo(0)
            $0.top.equalTo(Header.snp.bottom).offset(48)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(0)
        }
        
        ContentView.snp.makeConstraints {
            $0.edges.equalTo(0)
            $0.width.equalToSuperview()
            $0.bottom.equalTo(Name17.snp.bottom).offset(0)
        }
        
        NO1.snp.makeConstraints {
            $0.centerX.equalTo(NO2.snp.left).dividedBy(2)
            $0.height.width.equalTo(view.safeAreaLayoutGuide.snp.width).dividedBy(4)
            $0.top.equalToSuperview()
        }
        Name1.snp.makeConstraints {
            $0.top.equalTo(NO1.snp.bottom).offset(8)
            $0.centerX.equalTo(NO1)
        }
        
        
        NO2.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(view.safeAreaLayoutGuide.snp.width).dividedBy(4)
            $0.top.equalToSuperview()
        }
        Name2.snp.makeConstraints {
            $0.top.equalTo(NO2.snp.bottom).offset(8)
            $0.centerX.equalTo(NO2)
        }
        
        NO3.snp.makeConstraints {
            $0.centerX.equalTo(NO1.snp.left).multipliedBy(13)
            $0.height.width.equalTo(view.safeAreaLayoutGuide.snp.width).dividedBy(4)
            $0.top.equalToSuperview()
        }
        Name3.snp.makeConstraints {
            $0.top.equalTo(NO3.snp.bottom).offset(8)
            $0.centerX.equalTo(NO3)
        }
        
        NO4.snp.makeConstraints {
            $0.centerX.equalTo(NO1.snp.centerX)
            $0.top.equalTo(NO1.snp.bottom).offset(48)
            $0.height.width.equalTo(view.safeAreaLayoutGuide.snp.width).dividedBy(4)
        }
        Name4.snp.makeConstraints {
            $0.top.equalTo(NO4.snp.bottom).offset(8)
            $0.centerX.equalTo(NO4)
        }
        
        NO5.snp.makeConstraints {
            $0.centerX.equalTo(NO2.snp.centerX)
            $0.top.equalTo(NO2.snp.bottom).offset(48)
            $0.height.width.equalTo(view.safeAreaLayoutGuide.snp.width).dividedBy(4)
        }
        Name5.snp.makeConstraints {
            $0.top.equalTo(NO5.snp.bottom).offset(8)
            $0.centerX.equalTo(NO5)
        }
        
        NO6.snp.makeConstraints {
            $0.centerX.equalTo(NO3.snp.centerX)
            $0.top.equalTo(NO3.snp.bottom).offset(48)
            $0.height.width.equalTo(view.safeAreaLayoutGuide.snp.width).dividedBy(4)
        }
        Name6.snp.makeConstraints {
            $0.top.equalTo(NO6.snp.bottom).offset(8)
            $0.centerX.equalTo(NO6)
        }
        
        NO7.snp.makeConstraints {
            $0.centerX.equalTo(NO4.snp.centerX)
            $0.top.equalTo(NO4.snp.bottom).offset(48)
            $0.height.width.equalTo(view.safeAreaLayoutGuide.snp.width).dividedBy(4)
        }
        Name7.snp.makeConstraints {
            $0.top.equalTo(NO7.snp.bottom).offset(8)
            $0.centerX.equalTo(NO7)
        }
        
        NO8.snp.makeConstraints {
            $0.centerX.equalTo(NO5.snp.centerX)
            $0.top.equalTo(NO5.snp.bottom).offset(48)
            $0.height.width.equalTo(view.safeAreaLayoutGuide.snp.width).dividedBy(4)
        }
        Name8.snp.makeConstraints {
            $0.top.equalTo(NO8.snp.bottom).offset(8)
            $0.centerX.equalTo(NO8)
        }
        
        NO9.snp.makeConstraints {
            $0.centerX.equalTo(NO6.snp.centerX)
            $0.top.equalTo(NO6.snp.bottom).offset(48)
            $0.height.width.equalTo(view.safeAreaLayoutGuide.snp.width).dividedBy(4)
        }
        Name9.snp.makeConstraints {
            $0.top.equalTo(NO9.snp.bottom).offset(8)
            $0.centerX.equalTo(NO9)
        }
        
        NO10.snp.makeConstraints {
            $0.centerX.equalTo(NO7.snp.centerX)
            $0.top.equalTo(NO7.snp.bottom).offset(48)
            $0.height.width.equalTo(view.safeAreaLayoutGuide.snp.width).dividedBy(4)
        }
        Name10.snp.makeConstraints {
            $0.top.equalTo(NO10.snp.bottom).offset(8)
            $0.centerX.equalTo(NO10)
        }
        
        NO11.snp.makeConstraints {
            $0.centerX.equalTo(NO8.snp.centerX)
            $0.top.equalTo(NO8.snp.bottom).offset(48)
            $0.height.width.equalTo(view.safeAreaLayoutGuide.snp.width).dividedBy(4)
        }
        Name11.snp.makeConstraints {
            $0.top.equalTo(NO11.snp.bottom).offset(8)
            $0.centerX.equalTo(NO11)
        }
        
        NO12.snp.makeConstraints {
            $0.centerX.equalTo(NO9.snp.centerX)
            $0.top.equalTo(NO9.snp.bottom).offset(48)
            $0.height.width.equalTo(view.safeAreaLayoutGuide.snp.width).dividedBy(4)
        }
        Name12.snp.makeConstraints {
            $0.top.equalTo(NO12.snp.bottom).offset(8)
            $0.centerX.equalTo(NO12)
        }
        
        NO13.snp.makeConstraints {
            $0.centerX.equalTo(NO10.snp.centerX)
            $0.top.equalTo(NO10.snp.bottom).offset(48)
            $0.height.width.equalTo(view.safeAreaLayoutGuide.snp.width).dividedBy(4)
        }
        Name13.snp.makeConstraints {
            $0.top.equalTo(NO13.snp.bottom).offset(8)
            $0.centerX.equalTo(NO13)
        }
        
        NO14.snp.makeConstraints {
            $0.centerX.equalTo(NO11.snp.centerX)
            $0.top.equalTo(NO11.snp.bottom).offset(48)
            $0.height.width.equalTo(view.safeAreaLayoutGuide.snp.width).dividedBy(4)
        }
        Name14.snp.makeConstraints {
            $0.top.equalTo(NO14.snp.bottom).offset(8)
            $0.leftMargin.equalTo(NO14.snp.leftMargin)
            $0.centerX.equalTo(NO14)
        }
        
        NO15.snp.makeConstraints {
            $0.centerX.equalTo(NO12.snp.centerX)
            $0.top.equalTo(NO12.snp.bottom).offset(48)
            $0.height.width.equalTo(view.safeAreaLayoutGuide.snp.width).dividedBy(4)
        }
        Name15.snp.makeConstraints {
            $0.top.equalTo(NO15.snp.bottom).offset(8)
            $0.centerX.equalTo(NO15)
        }
        
        NO16.snp.makeConstraints {
            $0.centerX.equalTo(NO13.snp.centerX)
            $0.top.equalTo(NO13.snp.bottom).offset(48)
            $0.height.width.equalTo(view.safeAreaLayoutGuide.snp.width).dividedBy(4)
        }
        Name16.snp.makeConstraints {
            $0.top.equalTo(NO16.snp.bottom).offset(8)
            $0.centerX.equalTo(NO16)
        }
        
        NO17.snp.makeConstraints {
            $0.centerX.equalTo(NO14.snp.centerX)
            $0.top.equalTo(NO14.snp.bottom).offset(48)
            $0.height.width.equalTo(view.safeAreaLayoutGuide.snp.width).dividedBy(4)
        }
        Name17.snp.makeConstraints {
            $0.top.equalTo(NO17.snp.bottom).offset(8)
            $0.centerX.equalTo(NO17)
        }
        
        NO18.snp.makeConstraints {
            $0.centerX.equalTo(NO15.snp.centerX)
            $0.top.equalTo(NO15.snp.bottom).offset(48)
            $0.height.width.equalTo(view.safeAreaLayoutGuide.snp.width).dividedBy(4)
        }
        Name18.snp.makeConstraints {
            $0.top.equalTo(NO18.snp.bottom).offset(8)
            $0.centerX.equalTo(NO18)
        }
    }
    
    //MARK: - 버튼 액션 실행 함수
    
    func setButton() {
        NO1.addTarget(self, action: #selector(gotoClassinformation1), for: .touchUpInside)
        NO2.addTarget(self, action: #selector(gotoClassinformation2), for: .touchUpInside)
        NO3.addTarget(self, action: #selector(gotoClassinformation3), for: .touchUpInside)
        NO4.addTarget(self, action: #selector(gotoClassinformation4), for: .touchUpInside)
        NO5.addTarget(self, action: #selector(gotoClassinformation5), for: .touchUpInside)
        NO6.addTarget(self, action: #selector(gotoClassinformation6), for: .touchUpInside)
        NO7.addTarget(self, action: #selector(gotoClassinformation7), for: .touchUpInside)
        NO8.addTarget(self, action: #selector(gotoClassinformation8), for: .touchUpInside)
        NO9.addTarget(self, action: #selector(gotoClassinformation9), for: .touchUpInside)
        NO10.addTarget(self, action: #selector(gotoClassinformation10), for: .touchUpInside)
        NO11.addTarget(self, action: #selector(gotoClassinformation11), for: .touchUpInside)
        NO12.addTarget(self, action: #selector(gotoClassinformation12), for: .touchUpInside)
        NO13.addTarget(self, action: #selector(gotoClassinformation13), for: .touchUpInside)
        NO14.addTarget(self, action: #selector(gotoClassinformation14), for: .touchUpInside)
        NO15.addTarget(self, action: #selector(gotoClassinformation15), for: .touchUpInside)
        NO16.addTarget(self, action: #selector(gotoClassinformation16), for: .touchUpInside)
        NO17.addTarget(self, action: #selector(gotoClassinformation17), for: .touchUpInside)
        NO18.addTarget(self, action: #selector(gotoClassinformation18), for: .touchUpInside)
    }
}


