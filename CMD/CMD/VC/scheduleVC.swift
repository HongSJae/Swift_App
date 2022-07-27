//
//  ViewController.swift
//  CMD
//
//  Created by 홍승재 on 2022/06/30.
//

import UIKit
import Alamofire
import SnapKit
import Then

let getToken = UserDefaults.standard.string(forKey: "TokenToken")

class scheduleVC: UIViewController {
    private var Header = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 60)
        $0.text = "시간표"
    }
    
    private var date = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        let custom = DateFormatter()
        var WD: String = WeekDaydate(Want: "Weekday")
        custom.dateFormat = "yyyy년 M월 d일 "
        let nowdate: String = custom.string(from: .now)
        print(nowdate + "\(WD)요일")
        $0.text = nowdate + "\(WD)요일"
    }
    
    private var Class1 = UILabel().then {
        $0.text = "시간표1"
        $0.backgroundColor = UIColor(named: "ScheduleGrayColor")
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 25) //만약 현재시간에 따라 폰트가 바껴야 한다면 '35'로 바뀜
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    private var Class2 = UILabel().then {
        $0.text = "시간표2"
        $0.backgroundColor = UIColor(named: "ScheduleGrayColor")
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 25) //만약 현재시간에 따라 폰트가 바껴야 한다면 '35'로 바뀜
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    private var Class3 = UILabel().then {
        $0.text = "시간표3"
        $0.backgroundColor = UIColor(named: "ScheduleGrayColor")
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 25) //만약 현재시간에 따라 폰트가 바껴야 한다면 '35'로 바뀜
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    private var Class4 = UILabel().then {
        $0.text = "시간표4"
        $0.backgroundColor = UIColor(named: "ScheduleGrayColor")
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 25) //만약 현재시간에 따라 폰트가 바껴야 한다면 '35'로 바뀜
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    private var Class5 = UILabel().then {
        $0.text = "시간표5"
        $0.backgroundColor = UIColor(named: "ScheduleGrayColor")
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 25) //만약 현재시간에 따라 폰트가 바껴야 한다면 '35'로 바뀜
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    private var Class6 = UILabel().then {
        $0.text = "시간표6"
        $0.backgroundColor = UIColor(named: "ScheduleGrayColor")
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 25) //만약 현재시간에 따라 폰트가 바껴야 한다면 '35'로 바뀜
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    private var Class7 = UILabel().then {
        $0.text = "시간표7"
        $0.backgroundColor = UIColor(named: "ScheduleGrayColor")
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 25) //만약 현재시간에 따라 폰트가 바껴야 한다면 '35'로 바뀜
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    private var Class8 = UILabel().then {
        $0.text = "시간표8"
        $0.backgroundColor = UIColor(named: "ScheduleGrayColor")
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 25) //만약 현재시간에 따라 폰트가 바껴야 한다면 '35'로 바뀜
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    private var Class9 = UILabel().then {
        $0.text = "시간표9"
        $0.backgroundColor = UIColor(named: "ScheduleGrayColor")
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 25) //만약 현재시간에 따라 폰트가 바껴야 한다면 '35'로 바뀜
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    private var Class10 = UILabel().then {
        $0.text = "시간표10"
        $0.backgroundColor = UIColor(named: "ScheduleGrayColor")
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 25) //만약 현재시간에 따라 폰트가 바껴야 한다면 '35'로 바뀜
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    
    private var scrollView = UIScrollView().then {
//        $0.backgroundColor = .white //UIColor(named: "BackgroundColor")
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private var ContentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TokenToken = UserDefaults.standard.string(forKey: TokenToken) ?? ""
        let Weekday: String = WeekDaydate(Want: "WD")
        print(Weekday)
        
        print("받은 토큰은 : \(getToken ?? "nil")")
        getTimeSchedule(weekday: Weekday)
        
        self.view.backgroundColor = UIColor(named: "BackgroundColor")
        
        self.view.addSubview(Header)
        Header.snp.makeConstraints {
            $0.topMargin.equalTo(38)
            $0.leadingMargin.equalTo(50)
        }
        
        self.view.addSubview(date)
        date.snp.makeConstraints {
            $0.topMargin.equalTo(168)
            $0.trailingMargin.equalTo(-50)
        }
        
        self.view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview().inset(50)
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(215)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(0)
        }
        
        ContentView.addSubview(Class1)
        ContentView.addSubview(Class2)
        ContentView.addSubview(Class3)
        ContentView.addSubview(Class4)
        ContentView.addSubview(Class5)
        ContentView.addSubview(Class6)
        ContentView.addSubview(Class7)
        ContentView.addSubview(Class8)
        ContentView.addSubview(Class9)
        ContentView.addSubview(Class10)
        scrollView.addSubview(ContentView)
        
        Class1.snp.makeConstraints() {
            $0.top.equalTo(scrollView.snp.top).offset(0)
            $0.width.equalToSuperview()
            $0.height.equalTo(self.view.safeAreaLayoutGuide.snp.height).dividedBy(11)
        }
        Class2.snp.makeConstraints() {
            $0.top.equalTo(Class1.snp.bottom).offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(self.view.safeAreaLayoutGuide.snp.height).dividedBy(11)
        }
        Class3.snp.makeConstraints() {
            $0.top.equalTo(Class2.snp.bottom).offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(self.view.safeAreaLayoutGuide.snp.height).dividedBy(11)
        }
        Class4.snp.makeConstraints() {
            $0.top.equalTo(Class3.snp.bottom).offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(self.view.safeAreaLayoutGuide.snp.height).dividedBy(11)
        }
        Class5.snp.makeConstraints() {
            $0.top.equalTo(Class4.snp.bottom).offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(self.view.safeAreaLayoutGuide.snp.height).dividedBy(11)
        }
        Class6.snp.makeConstraints() {
            $0.top.equalTo(Class5.snp.bottom).offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(self.view.safeAreaLayoutGuide.snp.height).dividedBy(11)
        }
        Class7.snp.makeConstraints() {
            $0.top.equalTo(Class6.snp.bottom).offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(self.view.safeAreaLayoutGuide.snp.height).dividedBy(11)
        }
        Class8.snp.makeConstraints() {
            $0.top.equalTo(Class7.snp.bottom).offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(self.view.safeAreaLayoutGuide.snp.height).dividedBy(11)
        }
        Class9.snp.makeConstraints() {
            $0.top.equalTo(Class8.snp.bottom).offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(self.view.safeAreaLayoutGuide.snp.height).dividedBy(11)
        }
        Class10.snp.makeConstraints() {
            $0.top.equalTo(Class9.snp.bottom).offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(self.view.safeAreaLayoutGuide.snp.height).dividedBy(11)
//            $0.width.equalToSuperview()
//            $0.height.equalTo(self.view.safeAreaLayoutGuide.snp.height).dividedBy(11)
//            $0.top.equalTo(scrollView.snp.top).offset(767)
//            $0.bottom.equalTo(scrollView.snp.bottom).offset(-40)
        }
        ContentView.snp.makeConstraints {
            $0.edges.equalTo(0)
            $0.width.equalToSuperview()
            $0.bottom.equalTo(Class10.snp.bottom).offset(0)
        }
    }
    
    
    func getTimeSchedule(weekday: String) {
        print("불러온 토큰은 : \(getToken ?? "")")
        let url = "http://54.180.122.62:8080/user/timetable/" + weekday
        AF.request(url,
                   method: .get,
                   encoding: URLEncoding.queryString,
                   headers: ["Authorization": (getToken ?? "")]
        )
        .validate(statusCode: 200..<300)
        .response { result in
            do{
                let model = try JSONDecoder().decode(TimeGet.self, from: result.data!)
                print("success")
                self.Class1.text = model.period1st
                print(model.period1st)
                
                self.Class2.text = model.period2nd
                print(model.period2nd)
                
                self.Class3.text = model.period3th
                print(model.period3th)
                
                self.Class4.text = model.period4th
                print(model.period4th)
                
                self.Class5.text = model.period5th
                print(model.period5th)
                
                self.Class6.text = model.period6th
                print(model.period6th)
                
                self.Class7.text = model.period7th
                print(model.period7th)
                
                self.Class8.text = model.period8th
                print(model.period8th)
                
                self.Class9.text = model.period9th
                print(model.period9th)
                
                self.Class10.text = model.period10th
                print(model.period10th)
                
            } catch {
                print(error)
                print("에런데용 :( ?")
            }
        }
    }
}
func WeekDaydate(Want: String) -> String{
    if Want == "WD" {
        let custom = DateFormatter()
        custom.dateFormat = "E"
        let nowdate: String = custom.string(from: .now)
        print(nowdate)
        switch nowdate {
        case "월": return "mon"
        case "화": return "tue"
        case "수": return "wed"
        case "목": return "thu"
        case "금": return "fri"
        case "Mon": return "월"
        case "Tue": return "화"
        case "Wed": return "수"
        case "Thu": return "목"
        case "Fri": return "금"
        case "Sat": return "토"
        case "Sun": return "일"
        default:
            return nowdate
        }
    } else if Want == "Weekday"{
        let custom = DateFormatter()
        custom.dateFormat = "E"
        let nowdate: String = custom.string(from: .now)
        print(nowdate)
        switch nowdate {
        case "Mon": return "월"
        case "Tue": return "화"
        case "Wed": return "수"
        case "Thu": return "목"
        case "Fri": return "금"
        case "Sat": return "토"
        case "Sun": return "일"
        default:
            return nowdate
        }
    } else {
        return "error"
    }
}

