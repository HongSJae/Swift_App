import SwiftUI

struct ExchangedRateView: View {
    @Binding var resultValue: String
    @Binding var nowDate: String
    let unit: String
    func changeMoneyString(money: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.numberStyle = .decimal
        let result = numberFormatter.string(for: money) ?? "0"

        return "\(result)"
    }
    var body: some View {
        VStack(spacing: 0) {
            DismissButton()
            .padding(.leading, 24.35)
            .padding(.vertical, 14)
            ResultText(exchangeRate: changeMoneyString(money: Double(resultValue) ?? 0), unit: unit)
            Spacer()
        }
        .navigationBarHidden(true)
        .onDisappear() {
            resultValue = ""
            nowDate = UserDefaults.standard.string(forKey: "date") ?? "날짜를 인식할 수 없어요"
        }
    }
}

struct ChangedExchangeRateView_Previews: PreviewProvider {
    static var previews: some View {
        ExchangedRateView(resultValue: .constant("0"), nowDate: .constant("060304"), unit: "KRW")
    }
}
