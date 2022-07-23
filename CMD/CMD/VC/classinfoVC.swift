import UIKit
import Alamofire
import Then
import SnapKit

class classinfo: UIViewController {

    private var Header = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 50)
        $0.text = "학생정보"
    }
    
    
    private var NO1 = UIImageView().then {
        $0.image = UIImage(named: "Profile")
    }
    private var Name1 = UILabel().then {
        $0.text = "강용수"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private var NO2 = UIImageView().then {
        $0.image = UIImage(named: "Profile")
    }
    private var Name2 = UILabel().then {
        $0.text = "강지인"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private var NO3 = UIImageView().then {
        $0.image = UIImage(named: "Profile")
    }
    private var Name3 = UILabel().then {
        $0.text = "길근우"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private var NO4 = UIImageView().then {
        $0.image = UIImage(named: "Profile")
    }
    private var Name4 = UILabel().then {
        $0.text = "김민채"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private var NO5 = UIImageView().then {
        $0.image = UIImage(named: "Profile")
    }
    private var Name5 = UILabel().then {
        $0.text = "김은오"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private var NO6 = UIImageView().then {
        $0.image = UIImage(named: "Profile")
    }
    private var Name6 = UILabel().then {
        $0.text = "김정현"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private var NO7 = UIImageView().then {
        $0.image = UIImage(named: "Profile")
    }
    private var Name7 = UILabel().then {
        $0.text = "김주원"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private var NO8 = UIImageView().then {
        $0.image = UIImage(named: "Profile")
    }
    private var Name8 = UILabel().then {
        $0.text = "김현민"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private var NO9 = UIImageView().then {
        $0.image = UIImage(named: "Profile")
    }
    private var Name9 = UILabel().then {
        $0.text = "마재영"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private var NO10 = UIImageView().then {
        $0.image = UIImage(named: "Profile")
    }
    private var Name10 = UILabel().then {
        $0.text = "유나현"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private var NO11 = UIImageView().then {
        $0.image = UIImage(named: "Profile")
    }
    private var Name11 = UILabel().then {
        $0.text = "유현담"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private var NO12 = UIImageView().then {
        $0.image = UIImage(named: "Profile")
    }
    private var Name12 = UILabel().then {
        $0.text = "윤정민?"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private var NO13 = UIImageView().then {
        $0.image = UIImage(named: "Profile")
    }
    private var Name13 = UILabel().then {
        $0.text = "정승훈"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private var NO14 = UIImageView().then {
        $0.image = UIImage(named: "Profile")
    }
    private var Name14 = UILabel().then {
        $0.text = "정지관"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private var NO15 = UIImageView().then {
        $0.image = UIImage(named: "Profile")
    }
    private var Name15 = UILabel().then {
        $0.text = "조문성"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private var NO16 = UIImageView().then {
        $0.image = UIImage(named: "Profile")
    }
    private var Name16 = UILabel().then {
        $0.text = "최하은"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private var NO17 = UIImageView().then {
        $0.image = UIImage(named: "Profile")
    }
    private var Name17 = UILabel().then {
        $0.text = "한예슬"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private var NO18 = UIImageView().then {
        $0.image = UIImage(named: "Profile")
    }
    private var Name18 = UILabel().then {
        $0.text = "홍승재"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    
    private var scrollView = UIScrollView().then {
//        $0.backgroundColor = .white //UIColor(named: "BackgroundColor")
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(named: "BackgroundColor")
        // Do any additional setup after loading the view.
        [Header, NO1, Name1, NO2, Name2, NO3, Name3, NO4, Name4, NO5, Name5, NO6, Name6, NO7, Name7, NO8, Name8, NO9, Name9, NO10, Name10, NO11, Name11, NO12, Name12, NO13, Name13, NO14, Name14, NO15, Name15, NO16, Name16, NO17, Name17, NO18, Name18].forEach({view.addSubview($0)})
        
        Header.snp.makeConstraints() {
            $0.leftMargin.equalTo(30)
            $0.topMargin.equalTo(48)
        }
        
        NO1.snp.makeConstraints {
            $0.centerX.equalTo(NO2.snp.left).dividedBy(2)
            $0.height.width.equalTo(view.safeAreaLayoutGuide.snp.width).dividedBy(4)
            $0.top.equalTo(Header.snp.bottom).offset(86)
        }
        Name1.snp.makeConstraints {
            $0.top.equalTo(NO1.snp.bottom).offset(8)
            $0.leftMargin.equalTo(NO1.snp.leftMargin)
            $0.centerX.equalTo(NO1)
        }
        
        
        NO2.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(view.safeAreaLayoutGuide.snp.width).dividedBy(4)
            $0.top.equalTo(Header.snp.bottom).offset(86)
        }
        Name2.snp.makeConstraints {
            $0.top.equalTo(NO2.snp.bottom).offset(8)
            $0.leftMargin.equalTo(NO2.snp.leftMargin)
            $0.centerX.equalTo(NO2)
        }
        
        NO3.snp.makeConstraints {
            $0.centerX.equalTo(NO1.snp.left).multipliedBy(13)
            $0.height.width.equalTo(view.safeAreaLayoutGuide.snp.width).dividedBy(4)
            $0.top.equalTo(Header.snp.bottom).offset(86)
        }
        Name3.snp.makeConstraints {
            $0.top.equalTo(NO3.snp.bottom).offset(8)
            $0.leftMargin.equalTo(NO3.snp.leftMargin)
            $0.centerX.equalTo(NO3)
        }
        
        NO4.snp.makeConstraints {
            $0.centerX.equalTo(NO1.snp.centerX)
            $0.top.equalTo(NO1.snp.bottom).offset(48)
            $0.height.width.equalTo(view.safeAreaLayoutGuide.snp.width).dividedBy(4)
        }
        Name4.snp.makeConstraints {
            $0.top.equalTo(NO4.snp.bottom).offset(8)
            $0.leftMargin.equalTo(NO4.snp.leftMargin)
            $0.centerX.equalTo(NO4)
        }
        
        
    }
}

