//
//  KindOfSportsBUtton.swift
//  DMSports
//
//  Created by 홍승재 on 2022/11/29.
//

import SwiftUI

struct KindOfSportsButton: View {
    @Binding var event: Sports
    let sports: Sports
    private func returnName() -> String {
        switch sports {
        case .배드민턴:
            return "배드민턴"
        case .축구:
            return "축구"
        case .농구:
            return "농구"
        case .배구:
            return "배구"
        }
    }
    var body: some View {
        Button {
            event = sports
        } label: {
            VStack(alignment: .leading, spacing: 0) {
                Text(returnName())
                    .font(.custom("Inter-SemiBold", size: 18))
                    .foregroundColor(.black)
                    .padding(.top, 12)
                    .padding(.leading, 16)
                Image(returnName())
                    .resizable()
                    .frame(width: 36, height: 36)
                    .padding(.top, 36)
                    .padding(.trailing, 34)
                    .padding(.leading, 66)
                    .padding(.bottom, 44)
            }
            .background()
            .cornerRadius(20)
            .padding(2)
            .background(event == sports ? Color.primary1 : Color.white)
            .cornerRadius(20)
        }
    }
}

struct KindOfSportsButton_Previews: PreviewProvider {
    static var previews: some View {
        KindOfSportsButton(event: .constant(.배드민턴), sports: .배드민턴)
    }
}
