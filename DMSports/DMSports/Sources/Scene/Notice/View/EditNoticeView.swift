//
//  EditNoticeView.swift
//  DMSports
//
//  Created by 홍승재 on 2022/11/29.
//

import SwiftUI

struct EditNoticeView: View {
    @State private var title: String = ""
    @State private var content: String = ""
    let edit: () -> Void
    let close: () -> Void
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("공지 제목")
                    .font(.custom("Inter-SemiBold", size: 20))
                    .foregroundColor(.hint)
                    .padding(.bottom, 12)
                TextField("", text: $title)
                    .font(.custom("Inter-Regular", size: 16))
                    .foregroundColor(.black)
                    .padding(16)
                    .background(.white)
                    .cornerRadius(20)
                    .padding(.bottom, 20)
                Text("공지 제목")
                    .font(.custom("Inter-SemiBold", size: 20))
                    .foregroundColor(.hint)
                    .padding(.bottom, 12)
                TextEditor(text: $content)
                    .font(.custom("Inter-Regular", size: 16))
                    .foregroundColor(.black)
                    .background(.white)
                    .cornerRadius(20)
                    .frame(height: 150)
                    .padding(.bottom, 16)
                HStack {
                    Spacer()
                    Button {
                        close()
                    } label: {
                        Text("취소")
                            .font(.custom("Inter-SemiBold", size: 18))
                            .foregroundColor(.hint)
                            .padding(.vertical, 9)
                            .padding(.horizontal, 23)
                    }
                    Button {
                        edit()
                    } label: {
                        Text("확인")
                            .font(.custom("Inter-SemiBold", size: 18))
                            .foregroundColor(.white)
                            .padding(.vertical, 9)
                            .padding(.horizontal, 23)
                            .background(Color.primary1)
                            .cornerRadius(20)
                            .padding(.trailing, 8)
                    }
                }
            }
            .padding(15)
            .background(Color.base)
            .cornerRadius(20)
        }
    }
}

struct EditNoticeView_Previews: PreviewProvider {
    static var previews: some View {
        EditNoticeView(edit: {}, close: {})
    }
}
