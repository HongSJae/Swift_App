//
//  MainView.swift
//  DMS for dsm Watch App
//
//  Created by 홍승재 on 2022/12/13.
//

import SwiftUI

struct MainView: View {
    enum Time {
        case year
        case month
        case date
    }
    @StateObject var mainViewModel = MainViewModel()
    private func dateformatter(_ time: Time) -> String {
        let nowDate = Date() // 현재의 Date (ex: 2020-08-13 09:14:48 +0000)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = {
            switch time {
            case .year: return "y"
            case .month: return "M"
            case .date: return "d"
            }
        }() // 2020-08-13 16:30
        let str = dateFormatter.string(from: nowDate) // 현재 시간의 Date를 format에 맞춰 string으로 반환
        return str
    }
    private func toDayDate() -> String {
        let nowDate = Date() // 현재의 Date (ex: 2020-08-13 09:14:48 +0000)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "y년 M월 d일 EEEE"
        dateFormatter.locale = Locale(identifier:"ko_KR") // PM, AM을 언어에 맞게 setting (ex: PM -> 오후)
        let str = dateFormatter.string(from: nowDate) // 현재 시간의 Date를 format에 맞춰 string으로 반환
        return str
    }
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack(alignment: .leading) {
                    Text("오늘의 메뉴")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                    Text(toDayDate())
                        .foregroundColor(.secondary)
                        .font(.system(size: 15))
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            VStack {
                                Text("아침")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                ForEach(mainViewModel.menu.breakfast, id: \.self) { data in
                                    Text(data)
                                        .foregroundColor(.white)
                                }
                            }
                            .frame(width: proxy.size.width - 10,
                                   height: 150)
                            .background(Color.main)
                            .cornerRadius(10)
                            VStack {
                                Text("점심")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                ForEach(mainViewModel.menu.lunch, id: \.self) { data in
                                    Text(data)
                                        .foregroundColor(.white)
                                }
                            }
                            .frame(width: proxy.size.width - 10,
                                   height: 150)
                            .background(Color.main)
                            .cornerRadius(10)
                            VStack {
                                Text("저녁")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                ForEach(mainViewModel.menu.dinner, id: \.self) { data in
                                    Text(data)
                                        .foregroundColor(.white)
                                }
                            }
                            .frame(width: proxy.size.width - 10,
                                   height: 150)
                            .background(Color.main)
                            .cornerRadius(10)
                        }
                    }
                    .onAppear {
                        mainViewModel.year = dateformatter(.year)
                        mainViewModel.month = dateformatter(.month)
                        mainViewModel.date = dateformatter(.date)
                        mainViewModel.allergy = false
                        mainViewModel.getMenu()
                    }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
