//
//  MainView.swift
//  DMS for dsm Watch App
//
//  Created by 홍승재 on 2022/12/13.
//

import SwiftUI

struct ScheduleView: View {
    @StateObject var scheduleViewModel = ScheduleViewModel()
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading, spacing: 0) {
                Text(scheduleViewModel.titleDayDate())
                    .foregroundColor(.secondary)
                    .font(.system(size: 15))
                    .padding(.leading, 10)
                ScrollView {
                    ForEach(0..<scheduleViewModel.perio.count, id: \.self) { index in
                        switch scheduleViewModel.progress {
                        case true: ProgressView()
                        case false:
                            HStack {
                                Text("\(scheduleViewModel.perio[index])교시")
                                    .font(.system(size: 10))
                                    .fontWeight(.light)
                                    .foregroundColor(.secondary)
                                    .padding(.leading, 16)
                                Spacer()
                                Text(scheduleViewModel.schedule[index])
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            .cornerRadius(10)
                        }
                    }
                    .padding(.vertical, 5)
                    HStack {
                        Button {
                            scheduleViewModel.backDate()
                            scheduleViewModel.progress = true
                        } label: {
                            Text("이전")
                                .fontWeight(.bold)
                                .foregroundColor(.main)
                        }
                        Spacer()
                        Button {
                            scheduleViewModel.nextDate()
                            scheduleViewModel.progress = true
                        } label: {
                            Text("다음")
                                .fontWeight(.bold)
                                .foregroundColor(.main)
                        }
                    }
                    .onAppear {
                        scheduleViewModel.grade = "1"
                        scheduleViewModel._class = "2"
                        scheduleViewModel.updateDate()
                    }
                }
            }
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
