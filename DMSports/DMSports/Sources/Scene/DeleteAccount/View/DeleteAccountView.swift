//
//  DeleteAccountView.swift
//  DMSports
//
//  Created by 홍승재 on 2022/11/30.
//

import SwiftUI

struct DeleteAccountView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var password: String = ""
    @State private var visible: Bool = false
    @State private var showAlert = false
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading, spacing: 0) {
                Button {
                    dismiss()
                } label: {
                    Image("Back")
                        .resizable()
                        .frame(width: 16, height: 16)
                }
                Spacer()
                Text("회원탈퇴")
                    .foregroundColor(.primary1)
                    .font(.custom("Inter-Bold", size: 48))
                Text("DMSport.")
                    .foregroundColor(.primary2)
                    .font(.custom("Inter-Bold", size: 32))
                    .padding(.bottom, 100)
                PasswordTextfield(text: $password,
                                  isSee: $visible,
                                  placeHolder: "비밀번호를 다시 입력해 주세요")
                .padding(.bottom, 48)
                
                HStack {
                    Spacer()
                    Text("비밀번호를 잊으셨나요?")
                        .foregroundColor(.primary2)
                        .font(.custom("Inter-Regular", size: 14))
                    Spacer()
                }
                Spacer()
                Button {
                    showAlert = true
                } label: {
                    Text("회원 탈퇴")
                        .foregroundColor(.white)
                        .font(.custom("Inter-SemiBold", size: 18))
                        .padding(.vertical, 13)
                        .frame(width: proxy.size.width - 32)
                        .background(Color.primary1)
                        .cornerRadius(20)
                        .padding(.bottom, 12)
                }
            }
            .navigationBarHidden(true)
            .padding(16)
            .alert("정말 탈퇴하시겠습니까?", isPresented: $showAlert) {
                Button("탈퇴", role: .destructive) { }
                Button("취소", role: .cancel) { }
            } message: {
                Text("회원 탈퇴 시 사용자의 정보가 삭제됩니다.")
            }
        }
    }
}

struct DeleteAccountView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteAccountView()
    }
}
