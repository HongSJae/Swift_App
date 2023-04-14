//
//  NoticeDetailView.swift
//  DMSports
//
//  Created by 홍승재 on 2022/11/30.
//

import SwiftUI

struct NoticeDetailView: View {
    @Binding var close: Bool
    @Binding var showEdit: Bool
    @Binding var showDelete: Bool
    let title: String
    let content: String
    let date: String
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color.base.ignoresSafeArea()
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Button {
                            close.toggle()
                        } label: {
                            Image("Back")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .padding(.vertical, 16)
                        }
                        Spacer()
                        Menu {
                            Button("수정", action: {  })
                            Button("삭제", action: {  })
                        } label: {
                            Image("dotdotdot")
                        }
                        .padding(.bottom, 8)
                    }
                    VStack(alignment: .leading, spacing: 0) {
                        Text(title)
                            .font(.custom("Inter-SemiBold", size: 20))
                            .foregroundColor(.hint)
                            .padding(.bottom, 4)
                        Text(date)
                            .font(.custom("Inter-Medium", size: 10))
                            .foregroundColor(.hint)
                            .padding(.bottom, 8)
                        Text(content)
                            .font(.custom("Inter-Regular", size: 14))
                            .foregroundColor(.hint)
                        Spacer()
                        Rectangle()
                            .frame(height: 0)
                    }
                    .padding(16)
                    .background(Color.white)
                    .cornerRadius(20)
                    .ignoresSafeArea()
                }
                .background(Color.base)
                .padding(.horizontal, 16)
            }
        }
    }
}

struct NoticeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NoticeDetailView(close: .constant(true),
                         showEdit: .constant(false),
                         showDelete: .constant(false),
                         title: "준수야 그러면 안된다",
                         content: "준수야 그러면 안돼, 준수야 그러면 안돼, 장지성 아님준수야 그러면 안돼, 준수야 그러면 안돼, 장지성 아님준수야 그러면 안돼, 준수야 그러면 안돼, 장지성 아님준수야 그러면 안돼, 준수야 그러면 안돼, 장지성 아님준수야 그러면 안돼, 준수야 그러면 안돼, 장지성 아님준수야 그러면 안돼, 준수야 그러면 안돼, 장지성 아님",
                         date: "22시간 전")
    }
}
