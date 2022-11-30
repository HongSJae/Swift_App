//
//  MyView.swift
//  DMSports
//
//  Created by 홍승재 on 2022/11/30.
//

import SwiftUI

struct MyView: View {
    @State private var switchToggle = false
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color.primary0.ignoresSafeArea()
                ZStack(alignment: .top) {
                    Color.base.ignoresSafeArea()
                    VStack(alignment: .leading, spacing: 0) {
                        HStack(alignment: .bottom, spacing: 4) {
                            Text("김관리자")
                                .font(.custom("Inter-SemiBold", size: 20))
                                .foregroundColor(.black)
                            Text("ADMIN")
                                .font(.custom("Inter-Regular", size: 14))
                                .foregroundColor(.hint)
                        }
                        Text("pjs0508" + "@dsm.hs.kr")
                            .font(.custom("Inter-Regular", size: 14))
                            .foregroundColor(.hint)
                            .padding(.bottom, 20)
                        HStack {
                            Text("비밀번호 변경")
                                .font(.custom("Inter-Bold", size: 16))
                                .foregroundColor(.hint)
                            Spacer()
                            Image("Back-1")
                                .resizable()
                                .frame(width: 7, height: 13)
                        }
                        .padding(16)
                        .background(.white)
                        .cornerRadius(20)
                        .padding(.bottom, 12)
                        HStack {
                            Text("종목 빈자리 자동 참여")
                                .font(.custom("Inter-Bold", size: 16))
                                .foregroundColor(.hint)
                            Spacer()
                        }
                        .padding(16)
                        .background(.white)
                        .cornerRadius(20)
                        .padding(.bottom, 12)
                        HStack {
                            Text("로그아웃")
                                .font(.custom("Inter-Bold", size: 16))
                                .foregroundColor(.highlight)
                            Spacer()
                            Image("Back-2")
                                .resizable()
                                .frame(width: 7, height: 13)
                        }
                        .padding(16)
                        .background(.white)
                        .cornerRadius(20)
                        .padding(.bottom, 12)
                        HStack {
                            Text("회원 탈퇴")
                                .font(.custom("Inter-Bold", size: 16))
                                .foregroundColor(.highlight)
                            Spacer()
                            Image("Back-2")
                                .resizable()
                                .frame(width: 7, height: 13)
                        }
                        .padding(16)
                        .background(.white)
                        .cornerRadius(20)
                        .padding(.bottom, 12)
                    }
                    .padding(28)
                }
                .cornerRadius(20, corners: .topLeft)
                .cornerRadius(20, corners: .topRight)
                .padding(.top, proxy.size.height / 9)
            }
        }
    }
}
/*
struct ColoredToggleStyle: ToggleStyle {
    var label = ""
    var onColor = Color.primary1
    var offColor = Color.disabledColor
    var thumbColor = Color.white
    
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            Text(label)
            Spacer()
            Button(action: { configuration.isOn.toggle() } )
            {
                RoundedRectangle(cornerRadius: 20, style: .circular)
                    .fill(configuration.isOn ? onColor : offColor)
                    .frame(width: 48, height: 24)
                    .overlay(
                        Circle()
                            .fill(thumbColor)
                            .offset(x: configuration.isOn ? 100 : -10))
                    .animation(Animation.easeInOut(duration: 0.15))
            }
            .buttonStyle(.plain)
        }
        .font(.title)
        .padding(.horizontal)
    }
}
*/
struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView()
    }
}
