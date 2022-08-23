//
//  scheduleVCViewController.swift
//  CMD
//
//  Created by 홍승재 on 2022/06/30.
//

import UIKit
import Alamofire
import SnapKit
import Then

class scheduleVC: UIViewController {
    
    //MARK: - 뷰 생성
    
    //헤더
    private var Header = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 60)
        $0.text = "시간표"
    }
    
    //날짜
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
    
    //1교시
    private var Class1 = UILabel().then {
        $0.text = "시간표1"
        $0.backgroundColor = UIColor(named: "ScheduleGrayColor")
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 25) //만약 현재시간에 따라 폰트가 바껴야 한다면 '35'로 바뀜
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    //2교시
    private var Class2 = UILabel().then {
        $0.text = "시간표2"
        $0.backgroundColor = UIColor(named: "ScheduleGrayColor")
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 25) //만약 현재시간에 따라 폰트가 바껴야 한다면 '35'로 바뀜
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    //3교시
    private var Class3 = UILabel().then {
        $0.text = "시간표3"
        $0.backgroundColor = UIColor(named: "ScheduleGrayColor")
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 25) //만약 현재시간에 따라 폰트가 바껴야 한다면 '35'로 바뀜
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    //4교시
    private var Class4 = UILabel().then {
        $0.text = "시간표4"
        $0.backgroundColor = UIColor(named: "ScheduleGrayColor")
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 25) //만약 현재시간에 따라 폰트가 바껴야 한다면 '35'로 바뀜
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    //5교시
    private var Class5 = UILabel().then {
        $0.text = "시간표5"
        $0.backgroundColor = UIColor(named: "ScheduleGrayColor")
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 25) //만약 현재시간에 따라 폰트가 바껴야 한다면 '35'로 바뀜
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    //6교시
    private var Class6 = UILabel().then {
        $0.text = "시간표6"
        $0.backgroundColor = UIColor(named: "ScheduleGrayColor")
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 25) //만약 현재시간에 따라 폰트가 바껴야 한다면 '35'로 바뀜
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    //7교시
    private var Class7 = UILabel().then {
        $0.text = "시간표7"
        $0.backgroundColor = UIColor(named: "ScheduleGrayColor")
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 25) //만약 현재시간에 따라 폰트가 바껴야 한다면 '35'로 바뀜
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    //8교시
    private var Class8 = UILabel().then {
        $0.text = "시간표8"
        $0.backgroundColor = UIColor(named: "ScheduleGrayColor")
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 25) //만약 현재시간에 따라 폰트가 바껴야 한다면 '35'로 바뀜
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    //9교시
    private var Class9 = UILabel().then {
        $0.text = "시간표9"
        $0.backgroundColor = UIColor(named: "ScheduleGrayColor")
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 25) //만약 현재시간에 따라 폰트가 바껴야 한다면 '35'로 바뀜
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    //10교시
    private var Class10 = UILabel().then {
        $0.text = "시간표10"
        $0.backgroundColor = UIColor(named: "ScheduleGrayColor")
        $0.textAlignment = .center
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 25) //만약 현재시간에 따라 폰트가 바껴야 한다면 '35'로 바뀜
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    
    //스크롤뷰
    private var scrollView = UIScrollView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //콘탠트 뷰
    private var ContentView = UIView()
    
    //MARK: - 뷰 실행 시
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        token = UserDefaults.standard.string(forKey: "token")!
        let Weekday: String = WeekDaydate(Want: "WD")
        print(Weekday)
        
        //API
        getTimeSchedule(weekday: Weekday)
        
        self.view.backgroundColor = UIColor(named: "BackgroundColor")
        
        //뷰 선언
        [Header, date, scrollView].forEach({view.addSubview($0)})
        [ContentView].forEach({scrollView.addSubview($0)})
        [Class1, Class2, Class3, Class4, Class5, Class6, Class7, Class8, Class9, Class10].forEach({ContentView.addSubview($0)})
        
        layout()
        
    }
    
    //MARK: - 시간표 불러오기 함수
    
    func getTimeSchedule(weekday: String) {
        switch weekday {
        case "mon", "tue", "wed", "thu", "fri":
            let url = "http://54.180.122.62:8080/user/timetable/" + weekday
            AF.request(url,
                       method: .get,
                       encoding: URLEncoding.queryString,
                       headers: ["Authorization": token]
            )
            .validate(statusCode: 200..<300)
            .response { result in
                do{
                    let model = try JSONDecoder().decode(TimeGet.self, from: result.data!)
                    print("success")
                    self.Class1.text = model.period1st
                    print(model.period1st!)
                    
                    self.Class2.text = model.period2nd
                    print(model.period2nd!)
                    
                    self.Class3.text = model.period3th
                    print(model.period3th!)
                    
                    self.Class4.text = model.period4th
                    print(model.period4th!)
                    
                    self.Class5.text = model.period5th
                    print(model.period5th!)
                    
                    self.Class6.text = model.period6th
                    print(model.period6th!)
                    
                    self.Class7.text = model.period7th
                    print(model.period7th!)
                    
                    self.Class8.text = model.period8th
                    print(model.period8th!)
                    
                    self.Class9.text = model.period9th
                    print(model.period9th!)
                    
                    self.Class10.text = model.period10th
                    print(model.period10th!)
                    
                } catch {
                    print(error)
                    print("에런데용 :( ?")
                }
            }
        default:
            self.Class1.text = "시간표가 없어요!"
            
            self.Class2.text = "시간표가 없어요!"
            
            self.Class3.text = "시간표가 없어요!"
            
            self.Class4.text = "시간표가 없어요!"
            
            self.Class5.text = "시간표가 없어요!"
            
            self.Class6.text = "시간표가 없어요!"
            
            self.Class7.text = "시간표가 없어요!"
            
            self.Class8.text = "시간표가 없어요!"
            
            self.Class9.text = "시간표가 없어요!"
            
            self.Class10.text = "시간표가 없어요!"
        }
    }
    
    //MARK: - 레이아웃 함수
    
    func layout() {
        //헤더 레이아웃
        Header.snp.makeConstraints {
            $0.topMargin.equalTo(38)
            $0.leadingMargin.equalTo(50)
        }
        
        //날짜 레이아웃
        date.snp.makeConstraints {
            $0.topMargin.equalTo(168)
            $0.trailingMargin.equalTo(-50)
        }
        
        //스크롤뷰 레이아웃
        scrollView.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview().inset(50)
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(215)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(0)
        }
        
        
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
        }
        
        //콘탠트뷰 레이아웃
        ContentView.snp.makeConstraints {
            $0.edges.equalTo(0)
            $0.width.equalToSuperview()
            $0.bottom.equalTo(Class10.snp.bottom).offset(0)
        }
    }
}

//MARK: - 날짜 구하는 함수

func WeekDaydate(Want: String) -> String{
    if Want == "WD" {
        let custom = DateFormatter()
        custom.dateFormat = "E"
        let nowdate: String = custom.string(from: .now)
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

