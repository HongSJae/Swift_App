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
    
    
    private var scrollView = UIScrollView().then {
//        $0.backgroundColor = .white //UIColor(named: "BackgroundColor")
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(named: "BackgroundColor")
        // Do any additional setup after loading the view.
        [Header, NO1, Name1, NO2, Name2, NO3, Name3].forEach({view.addSubview($0)})
        
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
            $0.centerX.equalTo(NO2.snp.right)
            $0.height.width.equalTo(view.safeAreaLayoutGuide.snp.width).dividedBy(4)
            $0.top.equalTo(Header.snp.bottom).offset(86)
        }
        Name3.snp.makeConstraints {
            $0.top.equalTo(NO3.snp.bottom).offset(8)
            $0.leftMargin.equalTo(NO3.snp.leftMargin)
            $0.centerX.equalTo(NO3)
        }
        
        
        
    }
}

