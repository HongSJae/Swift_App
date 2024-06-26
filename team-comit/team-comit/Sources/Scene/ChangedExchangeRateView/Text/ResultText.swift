import SwiftUI

struct ResultText: View {
    @Environment(\.colorScheme) var scheme
    let exchangeRate: String
    let unit: String
    var body: some View {
        Text("환율 계산")
            .foregroundColor(Theme.fontColor(forScheme: scheme))
            .font(.system(size: 36))
            .fontWeight(.regular)
            .padding(.bottom, 112)
        Text("수취금액은 ")
            .foregroundColor(Theme.fontColor(forScheme: scheme)) +
        Text(exchangeRate)
            .bold()
            .foregroundColor(Theme.fontColor(forScheme: scheme)) +
        Text(" \(unit) 입니다")
            .foregroundColor(Theme.fontColor(forScheme: scheme))
    }
}

struct ResultText_Previews: PreviewProvider {
    static var previews: some View {
        ResultText(exchangeRate: "123123", unit: "KRW")
    }
}
