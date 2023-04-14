//
//  MainView.swift
//  DMS for dsm Watch App
//
//  Created by 홍승재 on 2022/12/13.
//

import SwiftUI

enum Time {
    case year
    case month
    case date
}

struct SchoolMealView: View {
    @StateObject var mainViewModel = SchoolViewModel()
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading, spacing: 0) {
                Text(mainViewModel.titleDayDate())
                    .foregroundColor(.secondary)
                    .font(.system(size: 15))
                    .padding(.leading, 10)
                ScrollView {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            VStack {
                                switch mainViewModel.progress {
                                case true:
                                    ProgressView()
                                case false:
                                    Text(mainViewModel.menu.breakfast.isEmpty ? "급식이 없어요" : "아침")
                                        .font(.system(size: 20))
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    ForEach(mainViewModel.menu.breakfast, id: \.self) { data in
                                        Text(data)
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                            .frame(width: proxy.size.width - 10,
                                   height: 150)
                            .background(Color.main)
                            .cornerRadius(10)
                            VStack {
                                switch mainViewModel.progress {
                                case true:
                                    ProgressView()
                                case false:
                                    Text(mainViewModel.menu.lunch.isEmpty ? "급식이 없어요" : "점심")
                                        .font(.system(size: 20))
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    ForEach(mainViewModel.menu.lunch, id: \.self) { data in
                                        Text(data)
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                            .frame(width: proxy.size.width - 10,
                                   height: 150)
                            .background(Color.main)
                            .cornerRadius(10)
                            VStack {
                                switch mainViewModel.progress {
                                case true:
                                    ProgressView()
                                case false:
                                    Text(mainViewModel.menu.dinner.isEmpty ? "급식이 없어요" : "저녁")
                                        .font(.system(size: 20))
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    ForEach(mainViewModel.menu.dinner, id: \.self) { data in
                                        Text(data)
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                            .frame(width: proxy.size.width - 10,
                                   height: 150)
                            .background(Color.main)
                            .cornerRadius(10)
                        }
                    }
                    .padding(.vertical, 5)
                    HStack {
                        Button {
                            mainViewModel.backDate()
                            mainViewModel.progress = true
                        } label: {
                            Text("이전")
                                .fontWeight(.bold)
                                .foregroundColor(.main)
                        }
                        Spacer()
                        Button {
                            mainViewModel.nextDate()
                            mainViewModel.progress = true
                        } label: {
                            Text("다음")
                                .fontWeight(.bold)
                                .foregroundColor(.main)
                        }
                    }
                    .onAppear {
                        mainViewModel.updateDate()
                    }
                }
            }
        }
    }
}

struct SchoolMealView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolMealView()
    }
}
