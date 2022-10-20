//
//  CalculatingButton.swift
//  team-comit
//
//  Created by 홍승재 on 2022/10/20.
//

import SwiftUI

struct CalculatingButton: View {
    @Environment(\.colorScheme) var scheme
    var body: some View {
        NavigationLink(destination: ChangedExchangeRateView()) {
            Text("환율 계산")
                .foregroundColor(Theme.fontColor(forScheme: scheme))
                .font(.system(size: 18))
                .fontWeight(.regular)
                .frame(width: 114, height: 34)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(
                            Theme.fontColor(forScheme: scheme),
                            lineWidth: 1)
                )
        }
    }
}

struct CalculatingButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatingButton()
    }
}
