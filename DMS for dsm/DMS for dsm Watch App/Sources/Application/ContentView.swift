//
//  ContentView.swift
//  DMS for dsm Watch App
//
//  Created by 홍승재 on 2022/12/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("DMS")
                    .foregroundColor(.main)
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                Text("in Apple Watch")
                    .font(.system(size: 10))
                    .fontWeight(.light)
                Spacer()
                NavigationLink("오늘의 메뉴", destination: {
                    SchoolMealView()
                        .navigationTitle("오늘의 메뉴")
                })
                Spacer()
                NavigationLink("오늘의 시간표", destination: {
                    ScheduleView()
                        .navigationTitle("오늘의 시간표")
                })
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
