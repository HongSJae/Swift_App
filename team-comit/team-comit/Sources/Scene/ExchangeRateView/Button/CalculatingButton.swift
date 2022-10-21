//
//  CalculatingButton.swift
//  team-comit
//
//  Created by 홍승재 on 2022/10/20.
//

import SwiftUI

struct CalculatingButton: View {
    @Environment(\.colorScheme) var scheme
    @StateObject var VM = ExchangeRateViewModel()
    @State private var tag: Int?
    @Binding var showingAlert: Bool
    let amount: String
    let unit_1: String
    let unit_2: String
    var body: some View {
        ZStack {
            NavigationLink(destination: ChangedExchangeRateView(resultValue: $VM.exchangeRate, unit: unit_1), tag: 1, selection: $tag ) { EmptyView() }
            Button {
                if Double(amount) ?? 0 < 0
                    || Double(amount) ?? 0 > 10000
                    || Double(amount) == nil
                {
                    showingAlert = true
                } else {
                    tag = 1
                    VM.amount = amount
                    VM.gettingCountry = unit_1
                    VM.sendingCountry = unit_2
                    VM.calculate()
                }
            } label: {
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
}


struct CalculatingButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatingButton(showingAlert: .constant(false), amount: "1", unit_1: "USD", unit_2: "KRW")
    }
}
