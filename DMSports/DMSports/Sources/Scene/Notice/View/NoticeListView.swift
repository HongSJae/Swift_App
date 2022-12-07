//
//  NoticeDetailView.swift
//  DMSports
//
//  Created by 홍승재 on 2022/11/29.
//

import SwiftUI
import PopupView

struct NoticeListView: View {
    @Binding var close: Bool
    @State private var showPost = false
    let title: String
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color.base.ignoresSafeArea()
                VStack(alignment: .leading, spacing: 0) {
                    Button {
                        close.toggle()
                    } label: {
                        Image("Back")
                            .resizable()
                            .frame(width: 16, height: 16)
                            .padding(.vertical, 16)
                    }
                    Text(title)
                        .font(.custom("Inter-SemiBold", size: 20))
                        .foregroundColor(.hint)
                        .padding(.bottom, 16)
                    ScrollView {
//                        ForEach(0..<20, id: \.self) { _ in
//                            NoticeForm(proxy: proxy)
//                                .padding(.bottom, 6)
//                        }
                    }
                }
                .padding(.horizontal, 16)
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
                            showPost = true
                        } label: {
                            Image("postBtn")
                                .resizable()
                                .frame(width: 52, height: 52)
                                .padding(24)
                        }

                    }
                }
            }
            Rectangle()
                .opacity(showPost
                         ? 0.2 : 0)
                .ignoresSafeArea()
            .popup(isPresented: $showPost, type: .default, position: .bottom, animation: .default, autohideIn: nil, dragToDismiss: true, closeOnTap: false, closeOnTapOutside: true, view: {
                PostNoticeView(edit: {}, close: {
                    showPost = false })
                .padding(.horizontal, 16)
            })
        }
    }
}

struct NoticeListView_Previews: PreviewProvider {
    static var previews: some View {
        NoticeListView(close: .constant(false),
                         title: "전체 공지사항")
    }
}
