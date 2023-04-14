//
//  DeleteNoticeView.swift
//  DMSports
//
//  Created by 홍승재 on 2022/11/29.
//

import SwiftUI

struct DeleteNoticeView: View {
    let close: () -> Void
    let delete: () -> Void
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("공지사항을 삭제하시겠습니까?")
                    .font(.custom("Inter-Medium", size: 16))
                    .foregroundColor(.hint)
                    .padding(.bottom, 30)
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
                        delete()
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

struct DeleteNoticeView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteNoticeView(close: {}, delete: {})
    }
}
