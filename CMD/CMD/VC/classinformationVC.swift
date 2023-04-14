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

let CellID = "Cell"

var getNumber: String = ""

var Seat: CLong = 0

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
    
    private var SeatPosition = UIView().then {
        $0.backgroundColor = UIColor(named: "SeatPosition")
        $0.layer.cornerRadius = 10
    }
    
    private var CollectionView: UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)

        return cv
    }()
    
    
    
    //MARK: - 뷰 실행 시
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //번호 불러오기
        getNumber = UserDefaults.standard.string(forKey: "Number")!
        
        //API
        ClassAPI(Number: getNumber)
        
        CollectionView.backgroundColor = UIColor(named: "SeatPosition")
        
        //뷰 선언
        [scrollview].forEach({view.addSubview($0)})
        [ContentView].forEach({scrollview.addSubview($0)})
        [profile, profilename, View, Header, nameinfotitle, nameinfo, birthinfotitle, birthinfo, fieldinfotitle, fieldinfo, numberinfotitle, numberinfo, Cancel, Header2, SeatPosition, CollectionView].forEach({ContentView.addSubview($0)})
        
        CollectionView.dataSource = self
        CollectionView.delegate = self

        token = UserDefaults.standard.string(forKey: "token")!
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
                   headers: ["Authorization": (token)]
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
            $0.trailing.leading.equalToSuperview().inset(30)
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(0)
        }
        //콘탠트뷰 레이아웃
        ContentView.snp.makeConstraints {
            $0.edges.equalTo(0)
            $0.width.equalToSuperview()
            $0.bottom.equalTo(SeatPosition.snp.bottom).offset(0)
        }
        //취소버튼 레이아웃
        Cancel.snp.makeConstraints {
            $0.height.width.equalTo(16)
            $0.top.equalTo(ContentView.snp.top).inset(20)
            $0.right.equalTo(SeatPosition.snp.right).inset(10)
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
        
        //헤더2 레이아웃
        Header2.snp.makeConstraints {
            $0.top.equalTo(Header.snp.bottom).offset(300)
            $0.centerX.equalTo(View)
        }
        
        //자리뷰 레이아웃
        SeatPosition.snp.makeConstraints {
            $0.top.equalTo(Header2.snp.bottom).offset(18)
            $0.centerX.equalToSuperview()
            $0.left.equalTo(ContentView).offset(30)
            $0.right.equalTo(scrollview).offset(-30)
            $0.bottom.equalTo(scrollview).offset(-30)
            $0.height.equalTo(self.view.safeAreaLayoutGuide.snp.height).dividedBy(4)
        }
        
        CollectionView.snp.makeConstraints { //이게 ios? iOS코드 다 간파당하죠?
            $0.edges.equalTo(SeatPosition.snp.edges).inset(20)
        }
        
        
        CollectionView.register(CollectionCell.self, forCellWithReuseIdentifier: CellID)
    }
    
    //MARK: - 버튼 액션 실행 함수
    
    func setButton() {
        Cancel.addTarget(self, action: #selector(CancelBtn), for: .touchUpInside)
    }
}

extension classinformationVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:    CellID, for: indexPath) as! CollectionCell
        
        cell.backgroundColor = UIColor(red: 0.692, green: 0.692, blue: 0.692, alpha: 1)
        cell.layer.cornerRadius = 5
        
        return cell
    }
    
    
}

extension classinformationVC: UICollectionViewDelegate {
    
}

extension classinformationVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CollectionView.frame.width / 8, height: CollectionView.frame.height / 7)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CollectionView.frame.width / 7
    }
}
