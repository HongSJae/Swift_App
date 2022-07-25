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
    
    
    private var NO1 = UIButton().then {
        $0.setImage(UIImage(named: "Profile"), for: .normal)
    }
    private var Name1 = UILabel().then {
        $0.text = "강용수"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private var NO2 = UIButton().then {
        $0.setImage(UIImage(named: "Profile"), for: .normal)
    }
    private var Name2 = UILabel().then {
        $0.text = "강지인"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private var NO3 = UIButton().then {
        $0.setImage(UIImage(named: "Profile"), for: .normal)
    }
    private var Name3 = UILabel().then {
        $0.text = "길근우"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private var NO4 = UIButton().then {
        $0.setImage(UIImage(named: "Profile"), for: .normal)
    }
    private var Name4 = UILabel().then {
        $0.text = "김민채"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private var NO5 = UIButton().then {
        $0.setImage(UIImage(named: "Profile"), for: .normal)
    }
    private var Name5 = UILabel().then {
        $0.text = "김은오"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private var NO6 = UIButton().then {
        $0.setImage(UIImage(named: "Profile"), for: .normal)
    }
    private var Name6 = UILabel().then {
        $0.text = "김정현"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private var NO7 = UIButton().then {
        $0.setImage(UIImage(named: "Profile"), for: .normal)
    }
    private var Name7 = UILabel().then {
        $0.text = "김주원"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private var NO8 = UIButton().then {
        $0.setImage(UIImage(named: "Profile"), for: .normal)
    }
    private var Name8 = UILabel().then {
        $0.text = "김현민"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private var NO9 = UIButton().then {
        $0.setImage(UIImage(named: "Profile"), for: .normal)
    }
    private var Name9 = UILabel().then {
        $0.text = "마재영"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private var NO10 = UIButton().then {
        $0.setImage(UIImage(named: "Profile"), for: .normal)
    }
    private var Name10 = UILabel().then {
        $0.text = "유나현"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private var NO11 = UIButton().then {
        $0.setImage(UIImage(named: "Profile"), for: .normal)
    }
    private var Name11 = UILabel().then {
        $0.text = "유현담"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private var NO12 = UIButton().then {
        $0.setImage(UIImage(named: "Profile"), for: .normal)
    }
    private var Name12 = UILabel().then {
        $0.text = "윤정민?"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private var NO13 = UIButton().then {
        $0.setImage(UIImage(named: "Profile"), for: .normal)
    }
    private var Name13 = UILabel().then {
        $0.text = "정승훈"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private var NO14 = UIButton().then {
        $0.setImage(UIImage(named: "Profile"), for: .normal)
    }
    private var Name14 = UILabel().then {
        $0.text = "정지관"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private var NO15 = UIButton().then {
        $0.setImage(UIImage(named: "Profile"), for: .normal)
    }
    private var Name15 = UILabel().then {
        $0.text = "조문성"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private var NO16 = UIButton().then {
        $0.setImage(UIImage(named: "Profile"), for: .normal)
    }
    private var Name16 = UILabel().then {
        $0.text = "최하은"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private var NO17 = UIButton().then {
        $0.setImage(UIImage(named: "Profile"), for: .normal)
    }
    private var Name17 = UILabel().then {
        $0.text = "한예슬"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private var NO18 = UIButton().then {
        $0.setImage(UIImage(named: "Profile"), for: .normal)
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
    private var ContentView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(named: "BackgroundColor")
        // Do any additional setup after loading the view.
        view.addSubview(Header)
        view.addSubview(scrollView)
        scrollView.addSubview(ContentView)
        [NO1, Name1, NO2, Name2, NO3, Name3, NO4, Name4, NO5, Name5, NO6, Name6, NO7, Name7, NO8, Name8, NO9, Name9, NO10, Name10, NO11, Name11, NO12, Name12, NO13, Name13, NO14, Name14, NO15, Name15, NO16, Name16, NO17, Name17, NO18, Name18].forEach({ContentView.addSubview($0)})
        
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
            $0.leftMargin.equalTo(NO1.snp.leftMargin)
            $0.centerX.equalTo(NO1)
        }
        
        
        NO2.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(view.safeAreaLayoutGuide.snp.width).dividedBy(4)
            $0.top.equalToSuperview()
        }
        Name2.snp.makeConstraints {
            $0.top.equalTo(NO2.snp.bottom).offset(8)
            $0.leftMargin.equalTo(NO2.snp.leftMargin)
            $0.centerX.equalTo(NO2)
        }
        
        NO3.snp.makeConstraints {
            $0.centerX.equalTo(NO1.snp.left).multipliedBy(13)
            $0.height.width.equalTo(view.safeAreaLayoutGuide.snp.width).dividedBy(4)
            $0.top.equalToSuperview()
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
        
        NO5.snp.makeConstraints {
            $0.centerX.equalTo(NO2.snp.centerX)
            $0.top.equalTo(NO2.snp.bottom).offset(48)
            $0.height.width.equalTo(view.safeAreaLayoutGuide.snp.width).dividedBy(4)
        }
        Name5.snp.makeConstraints {
            $0.top.equalTo(NO5.snp.bottom).offset(8)
            $0.leftMargin.equalTo(NO5.snp.leftMargin)
            $0.centerX.equalTo(NO5)
        }
        
        NO6.snp.makeConstraints {
            $0.centerX.equalTo(NO3.snp.centerX)
            $0.top.equalTo(NO3.snp.bottom).offset(48)
            $0.height.width.equalTo(view.safeAreaLayoutGuide.snp.width).dividedBy(4)
        }
        Name6.snp.makeConstraints {
            $0.top.equalTo(NO6.snp.bottom).offset(8)
            $0.leftMargin.equalTo(NO6.snp.leftMargin)
            $0.centerX.equalTo(NO6)
        }
        
        NO7.snp.makeConstraints {
            $0.centerX.equalTo(NO4.snp.centerX)
            $0.top.equalTo(NO4.snp.bottom).offset(48)
            $0.height.width.equalTo(view.safeAreaLayoutGuide.snp.width).dividedBy(4)
        }
        Name7.snp.makeConstraints {
            $0.top.equalTo(NO7.snp.bottom).offset(8)
            $0.leftMargin.equalTo(NO7.snp.leftMargin)
            $0.centerX.equalTo(NO7)
        }
        
        NO8.snp.makeConstraints {
            $0.centerX.equalTo(NO5.snp.centerX)
            $0.top.equalTo(NO5.snp.bottom).offset(48)
            $0.height.width.equalTo(view.safeAreaLayoutGuide.snp.width).dividedBy(4)
        }
        Name8.snp.makeConstraints {
            $0.top.equalTo(NO8.snp.bottom).offset(8)
            $0.leftMargin.equalTo(NO8.snp.leftMargin)
            $0.centerX.equalTo(NO8)
        }
        
        NO9.snp.makeConstraints {
            $0.centerX.equalTo(NO6.snp.centerX)
            $0.top.equalTo(NO6.snp.bottom).offset(48)
            $0.height.width.equalTo(view.safeAreaLayoutGuide.snp.width).dividedBy(4)
        }
        Name9.snp.makeConstraints {
            $0.top.equalTo(NO9.snp.bottom).offset(8)
            $0.leftMargin.equalTo(NO9.snp.leftMargin)
            $0.centerX.equalTo(NO9)
        }
        
        NO10.snp.makeConstraints {
            $0.centerX.equalTo(NO7.snp.centerX)
            $0.top.equalTo(NO7.snp.bottom).offset(48)
            $0.height.width.equalTo(view.safeAreaLayoutGuide.snp.width).dividedBy(4)
        }
        Name10.snp.makeConstraints {
            $0.top.equalTo(NO10.snp.bottom).offset(8)
            $0.leftMargin.equalTo(NO10.snp.leftMargin)
            $0.centerX.equalTo(NO10)
        }
        
        NO11.snp.makeConstraints {
            $0.centerX.equalTo(NO8.snp.centerX)
            $0.top.equalTo(NO8.snp.bottom).offset(48)
            $0.height.width.equalTo(view.safeAreaLayoutGuide.snp.width).dividedBy(4)
        }
        Name11.snp.makeConstraints {
            $0.top.equalTo(NO11.snp.bottom).offset(8)
            $0.leftMargin.equalTo(NO11.snp.leftMargin)
            $0.centerX.equalTo(NO11)
        }
        
        NO12.snp.makeConstraints {
            $0.centerX.equalTo(NO9.snp.centerX)
            $0.top.equalTo(NO9.snp.bottom).offset(48)
            $0.height.width.equalTo(view.safeAreaLayoutGuide.snp.width).dividedBy(4)
        }
        Name12.snp.makeConstraints {
            $0.top.equalTo(NO12.snp.bottom).offset(8)
            $0.leftMargin.equalTo(NO12.snp.leftMargin)
            $0.centerX.equalTo(NO12)
        }
        
        NO13.snp.makeConstraints {
            $0.centerX.equalTo(NO10.snp.centerX)
            $0.top.equalTo(NO10.snp.bottom).offset(48)
            $0.height.width.equalTo(view.safeAreaLayoutGuide.snp.width).dividedBy(4)
        }
        Name13.snp.makeConstraints {
            $0.top.equalTo(NO13.snp.bottom).offset(8)
            $0.leftMargin.equalTo(NO13.snp.leftMargin)
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
            $0.leftMargin.equalTo(NO15.snp.leftMargin)
            $0.centerX.equalTo(NO15)
        }
        
        NO16.snp.makeConstraints {
            $0.centerX.equalTo(NO13.snp.centerX)
            $0.top.equalTo(NO13.snp.bottom).offset(48)
            $0.height.width.equalTo(view.safeAreaLayoutGuide.snp.width).dividedBy(4)
        }
        Name16.snp.makeConstraints {
            $0.top.equalTo(NO16.snp.bottom).offset(8)
            $0.leftMargin.equalTo(NO16.snp.leftMargin)
            $0.centerX.equalTo(NO16)
        }
        
        NO17.snp.makeConstraints {
            $0.centerX.equalTo(NO14.snp.centerX)
            $0.top.equalTo(NO14.snp.bottom).offset(48)
            $0.height.width.equalTo(view.safeAreaLayoutGuide.snp.width).dividedBy(4)
        }
        Name17.snp.makeConstraints {
            $0.top.equalTo(NO17.snp.bottom).offset(8)
            $0.leftMargin.equalTo(NO17.snp.leftMargin)
            $0.centerX.equalTo(NO17)
        }
        
        NO18.snp.makeConstraints {
            $0.centerX.equalTo(NO15.snp.centerX)
            $0.top.equalTo(NO15.snp.bottom).offset(48)
            $0.height.width.equalTo(view.safeAreaLayoutGuide.snp.width).dividedBy(4)
        }
        Name18.snp.makeConstraints {
            $0.top.equalTo(NO18.snp.bottom).offset(8)
            $0.leftMargin.equalTo(NO18.snp.leftMargin)
            $0.centerX.equalTo(NO18)
        }
        
        
        
        
    }
}

