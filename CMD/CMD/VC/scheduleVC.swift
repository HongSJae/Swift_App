//
//  ViewController.swift
//  CMD
//
//  Created by 홍승재 on 2022/06/30.
//

import UIKit
import Alamofire
import SnapKit

class scheduleVC: UIViewController {
    
    var Weekday: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
//        WeekEscape()
//        print(Weekday)
//        getTimeSchedule(weekday: Weekday)
        
        view.backgroundColor = UIColor(named: "BackgroundColor")
                
        
    }
    
    
    
    func getTimeSchedule(weekday: String) {
        let url = "http://192.168.137.7:8080" + "/user/timetable/"
        AF.request(url + weekday,
                   method: .get,
                   encoding: URLEncoding.queryString,
                   headers: ["Content-Type":"application/json", "Accept":"application/json"])
        .validate(statusCode: 200..<300)
        .response { result in
            do{
                let model = try JSONDecoder().decode(TimeGet.self, from: result.data!)
                
                //                self._1stTime.text = model.period1st
                //                print(model.period1st)
                //
                //                self._2ndTime.text = model.period2nd
                //                print(model.period2nd)
                //
                //                self._3rdTime.text = model.period3th //3rd지만 근우가 잘못 보내서 수정해야함
                //                print(model.period3th)
                //
                //                self._4thTime.text = model.period4th
                //                print(model.period4th)
                //
                //                self._5thTime.text = model.period5th
                //                print(model.period5th)
                //
                //                self._6thTime.text = model.period6th
                //                print(model.period6th)
                //
                //                self._7thTime.text = model.period7th
                //                print(model.period7th)
                //
                //                self._8thTime.text = model.period8th
                //                print(model.period8th)
                //
                //                self._9thTime.text = model.period9th
                //                print(model.period9th)
                //
                //                self._10thTime.text = model.period10th
                //                print(model.period10th)
                
            } catch {
                print(error)
            }
        }
    }
    
    func WeekEscape() { // 오늘이 몇월 몇일인지 구해서 무슨 요일인지 구함
        var formatter_time = DateFormatter()
        
        formatter_time.dateFormat = "MM"
        var current_time_string = formatter_time.string(from: Date())
        
        
        formatter_time.dateFormat = "DD"
        var current_time_string1 = formatter_time.string(from: Date())
        
        
        Weekday = getWeekDay(month: Int(current_time_string)!, day: Int(current_time_string1)!)
        
        
    }
    
    func endOfMonth(atMonth: Int) -> Int { //몇일이 마지막날인지 구함 (요일가져올 때 필요)
        let set30: [Int] = [1,3,5,7,8,10,12]
        var endDay: Int = 0
        if atMonth == 2 {
            endDay = 28
        }else if set30.contains(atMonth) {
            endDay = 31
        }else {
            endDay = 30
        }
        
        return endDay
    }
    
    func getWeekDay(month: Int, day: Int) -> String { //요일 가져오기
        
        let week: [String] = ["sun", "mon", "tue", "wed", "thu", "fri", "sat"]
        var totalDay: Int = 0
        
        if month > 1 {
            for i in 1..<month {
                let endDay: Int = endOfMonth(atMonth: i)
                totalDay += endDay
            }
            
            totalDay = totalDay + day
            
        }else if month == 1 {
            totalDay = day
        }
        
        var index: Int = (totalDay) % 7
        
        if index > 0 {
            index = index - 1
        }
        
        return week[index]
    }
    
    func AlertFunc(title: String, message: String) { //알림띄우기
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        let action = UIAlertAction(
            title: "네",
            style: .default,
            handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    func removePoint(num: Double) -> String{ //점 지우기
        var floatNumString = String(num)
        
        while floatNumString.last == "0" {
            floatNumString.removeLast()
        }
        if floatNumString.last == "."{
            floatNumString.removeLast()
        }
        
        return floatNumString
    }
}

