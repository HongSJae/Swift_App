//
//  RemittanceAmountText.swift
//  team-comit
//
//  Created by 홍승재 on 2022/10/20.
//

import SwiftUI

struct RemittanceAmountText: View {
    @Environment(\.colorScheme) var scheme
    @Binding var amount: String
    let unit: String
    var body: some View {
        HStack {
            Text("송금액")
                .foregroundColor(Theme.fontColor(forScheme: scheme))
                .font(.system(size: 18))
                .fontWeight(.regular)
            Spacer()
            TextField("", text: $amount)
                .foregroundColor(Theme.fontColor(forScheme: scheme))
                .disableAutocorrection(true)
                .keyboardType(.decimalPad)
                .padding(.horizontal, 1)
                .multilineTextAlignment(.trailing)
                .overlay(
                        Rectangle()
                            .stroke(lineWidth: 1)
                    )
                .frame(width: 153, height: 20)
            Text(unit)
                .foregroundColor(Theme.fontColor(forScheme: scheme))
                .font(.system(size: 18))
                .fontWeight(.regular)
        }
    }
}

struct RemittanceAmountText_Previews: PreviewProvider {
    static var previews: some View {
        RemittanceAmountText(amount: .constant("100"), unit: "USD")
    }
}
