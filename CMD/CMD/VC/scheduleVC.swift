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

class scheduleVC: UIViewController {
    private var Header = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.boldSystemFont(ofSize: 60)
        $0.text = "시간표"
    }
    
    private var date = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.boldSystemFont(ofSize: 15)
        let custom = DateFormatter()
        custom.dateFormat = "yyyy년 MM월 dd일 EEE"
        $0.text = "date"
    }
    
    private var labelOne = UILabel().then {
        $0.text = "Scroll Top"
        $0.backgroundColor = .red
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private var labelTwo = UILabel().then {
        $0.text = "Scroll Bottom"
        $0.backgroundColor = .red
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private var scrollView = UIScrollView().then {
//        $0.backgroundColor = .white //UIColor(named: "BackgroundColor")
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let Weekday: String = WeekDaydate()
        
        print(Weekday)
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
//        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
//        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
//        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
//        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        scrollView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(50)
            $0.leading.equalToSuperview().inset(50)
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(215)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(0)
        }
        
        scrollView.addSubview(labelOne)

        labelOne.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40).isActive = true
        labelOne.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40).isActive = true

        scrollView.addSubview(labelTwo)

        labelTwo.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40).isActive = true
        labelTwo.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 1000).isActive = true
        labelTwo.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -40).isActive = true

    }
    
    
    
    func getTimeSchedule(weekday: String) {
        
        let url = "http://54.180.120.242:8080" + "/user/timetable/"
        AF.request(url + weekday,
                   method: .get,
                   encoding: URLEncoding.queryString,
                   headers: ["Authorization": ""])
        .validate(statusCode: 200..<300)
        .response { result in
            do{
                let model = try JSONDecoder().decode(TimeGet.self, from: result.data!)
                
//                self._1stTime.text = model.period1st
                print(model.period1st)
                
//                self._2ndTime.text = model.period2nd
                print(model.period2nd)
                
//                self._3rdTime.text = model.period3th //3rd지만 근우가 잘못 보내서 수정해야함
                print(model.period3th)
                
//                self._4thTime.text = model.period4th
                print(model.period4th)
                
//                self._5thTime.text = model.period5th
                print(model.period5th)
                
//                self._6thTime.text = model.period6th
                print(model.period6th)
                
//                self._7thTime.text = model.period7th
                print(model.period7th)
                
//                self._8thTime.text = model.period8th
                print(model.period8th)
                
//                self._9thTime.text = model.period9th
                print(model.period9th)
                
//                self._10thTime.text = model.period10th
                print(model.period10th)
                
            } catch {
                print(error)
            }
        }
    }
    
    func WeekDaydate() -> String{
        let custom = DateFormatter()
        custom.dateFormat = "yyyy년 M월 d일 E"
        let nowdate: String = custom.string(from: .now)
        return nowdate
    }
}

