import SwiftUI
import Combine

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
                .onReceive(Just(amount), perform: { _ in
                    if amount == "." {
                        amount = "0."
                    }
                    if (amount.filter({ ($0) == "." }).count == 2
                        || (amount.count == 2
                         && amount != "0."
                         && amount.first == "0")) {
                        amount.removeLast()
                    }
                })
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
