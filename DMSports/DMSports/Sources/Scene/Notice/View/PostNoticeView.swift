//
//  PostNoticeView.swift
//  DMSports
//
//  Created by 홍승재 on 2022/11/30.
//

import SwiftUI

struct PostNoticeView: View {
    @State private var title: String = ""
    @State private var content: String = ""
    let edit: () -> Void
    let close: () -> Void
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text("공지 제목")
                        .font(.custom("Inter-SemiBold", size: 20))
                        .foregroundColor(.hint)
                        .padding(.bottom, 12)
                    Spacer()
                    Menu {
                        Button("배드민턴", action: {  })
                        Button("농구", action: {  })
                        Button("축구", action: {  })
                        Button("배구", action: {  })
                    } label: {
                        HStack(alignment: .bottom, spacing: 0) {
                            Text("종목")
                                .foregroundColor(.hint)
                                .font(.custom("Inter-Regular", size: 14))
                                .padding(.trailing, 5)
                            Image("downTriangle")
                                .resizable()
                                .frame(width: 14, height: 8)
                                .padding(.bottom, 5)
                        }
                    }
                    .padding(.bottom, 8)
                }
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

struct PostNoticeView_Previews: PreviewProvider {
    static var previews: some View {
        PostNoticeView(edit: {}, close: {})
    }
}
