//
//  KindOfSportsBUtton.swift
//  DMSports
//
//  Created by 홍승재 on 2022/11/29.
//

import SwiftUI

struct KindOfSportsButton: View {
    @Binding var event: Club
    let sports: Club
    private func returnName() -> String {
        switch sports {
        case .BADMINTON:
            return "배드민턴"
        case .SOCCER:
            return "축구"
        case .BASKETBALL:
            return "농구"
        case .VOLLEYBALL:
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
        KindOfSportsButton(event: .constant(.BADMINTON), sports: .BADMINTON)
    }
}
