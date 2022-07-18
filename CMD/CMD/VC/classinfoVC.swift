import UIKit
import Alamofire
import Then
import SnapKit

class classinfo: UIViewController {

    private var Header = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.boldSystemFont(ofSize: 50)
        $0.text = "학생정보"
    }
    
//    private var NO1 = UIView().then {
//        $0.snp.makeConstraints() {
//            $0.height.equalTo(111)
//            $0.width.equalTo(80)
//        }
//
//        var view = UIView().then {
//            $0.snp.makeConstraints {
//                $0.
//            }
//            var image = UIImageView().then {
//                $0.image = UIImage(named: "CMD-Logo-B")
//                $0.snp.makeConstraints() {
//                    $0.centerX.equalToSuperview()
//                    $0.centerY.equalToSuperview()
//                }
//            }
//        }
//    }
    private var NO2 = UILabel().then {
        $0.text = "시간표2"
        $0.backgroundColor = UIColor(named: "ScheduleGrayColor")
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 25)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    private var NO3 = UILabel().then {
        $0.text = "시간표3"
        $0.backgroundColor = UIColor(named: "ScheduleGrayColor")
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 25)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    private var NO4 = UILabel().then {
        $0.text = "시간표4"
        $0.backgroundColor = UIColor(named: "ScheduleGrayColor")
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 25)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    private var NO5 = UILabel().then {
        $0.text = "시간표5"
        $0.backgroundColor = UIColor(named: "ScheduleGrayColor")
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 25)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    private var NO6 = UILabel().then {
        $0.text = "시간표6"
        $0.backgroundColor = UIColor(named: "ScheduleGrayColor")
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 25)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    private var NO7 = UILabel().then {
        $0.text = "시간표7"
        $0.backgroundColor = UIColor(named: "ScheduleGrayColor")
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 25)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    private var NO8 = UILabel().then {
        $0.text = "시간표8"
        $0.backgroundColor = UIColor(named: "ScheduleGrayColor")
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 25)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    private var NO9 = UILabel().then {
        $0.text = "시간표9"
        $0.backgroundColor = UIColor(named: "ScheduleGrayColor")
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 25)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    private var NO10 = UILabel().then {
        $0.text = "시간표10"
        $0.backgroundColor = UIColor(named: "ScheduleGrayColor")
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 25)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    
    private var NO11 = UILabel().then {
        $0.text = "시간표1"
        $0.backgroundColor = UIColor(named: "ScheduleGrayColor")
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 25)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    private var NO12 = UILabel().then {
        $0.text = "시간표2"
        $0.backgroundColor = UIColor(named: "ScheduleGrayColor")
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 25)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    private var NO13 = UILabel().then {
        $0.text = "시간표3"
        $0.backgroundColor = UIColor(named: "ScheduleGrayColor")
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 25)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    private var NO14 = UILabel().then {
        $0.text = "시간표4"
        $0.backgroundColor = UIColor(named: "ScheduleGrayColor")
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 25)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    private var NO15 = UILabel().then {
        $0.text = "시간표5"
        $0.backgroundColor = UIColor(named: "ScheduleGrayColor")
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 25)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    private var NO16 = UILabel().then {
        $0.text = "시간표6"
        $0.backgroundColor = UIColor(named: "ScheduleGrayColor")
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 25)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    private var NO17 = UILabel().then {
        $0.text = "시간표7"
        $0.backgroundColor = UIColor(named: "ScheduleGrayColor")
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 25)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    private var NO18 = UILabel().then {
        $0.text = "시간표8"
        $0.backgroundColor = UIColor(named: "ScheduleGrayColor")
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 25)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    
    private var scrollView = UIScrollView().then {
//        $0.backgroundColor = .white //UIColor(named: "BackgroundColor")
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(named: "BackgroundColor")
        // Do any additional setup after loading the view.
        self.view.addSubview(Header)
        
        Header.snp.makeConstraints() {
            $0.leftMargin.equalTo(30)
            $0.topMargin.equalTo(48)
        }
        
        
    }
}

