import SwiftUI

struct ExchangeRateView: View {
    @StateObject private var exchangeRateViewModel = ExchangeRateViewModel()
    @State private var remittance: Int = 1
    @State private var reception: Int = 0
    @State private var amount: String = ""
    @State private var nowDate: String = ""
    @State private var showingAlert: Bool = false
    let countrys = [
        "한국(KRW)",
        "미국(USD)",
        "일본(JPY)",
        "필리핀(PHP)",
    ]
    let units = [
        "KRW",
        "USD",
        "JPY",
        "PHP",
    ]
    func changeMoneyString(money: Double, unit_1: String, unit_2: String) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.numberStyle = .decimal
        let result = numberFormatter.string(for: money) ?? "0"

        return "\(result) \(unit_1) / \(unit_2)"
    }
    func exportDate() {
        let formatter_year = DateFormatter()
        formatter_year.dateFormat = "yyyy-MM-dd / HH:mm:ss"
        let current_year_string = formatter_year.string(from: Date())
        nowDate = current_year_string
    }
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                TitleText()
                DealText(pickerValue: $remittance,
                         titleText: "송금국가", countrys: countrys)
                .onChange(of: remittance) { newValue in
                    DispatchQueue.main.async {
                        exchangeRateViewModel.sendingCountry = units[newValue]
                        exchangeRateViewModel.gettingCountry = units[reception]
                        exchangeRateViewModel.calculate()
                        exportDate()
                    }
                }
                DealText(pickerValue: $reception,
                         titleText: "수취국가", countrys: countrys)
                .onChange(of: reception) { newValue in
                    DispatchQueue.main.async {
                        exchangeRateViewModel.sendingCountry = units[remittance]
                        exchangeRateViewModel.gettingCountry = units[newValue]
                        exchangeRateViewModel.calculate()
                        exportDate()
                    }
                }
                InformationText(titleText: "환율",
                                valueText: changeMoneyString(
                                    money: Double(exchangeRateViewModel.exchangeRate) ?? 0,
                                    unit_1: units[reception],
                                    unit_2: units[remittance]))
                InformationText(titleText: "조회시간",
                                valueText: nowDate)
                RemittanceAmountText(amount: $amount,
                                     unit: units[remittance])
                Spacer()
                CalculatingButton(showingAlert: $showingAlert,
                                  amount: amount,
                                  unit_1: units[reception],
                                  unit_2: units[remittance])
                .alert(isPresented: $showingAlert) {
                            Alert(title: Text("송금액이 바르지 않습니다."), message: Text("송금액을 확인하고 다시 시도해주세요.\n0 < x < 10,000"), dismissButton: .default(Text("확인")))
                        }
                Spacer()
                Spacer()
            }
            .onTapGesture {
                hideKeyboard()
            }
            .padding(.horizontal, 24)
            .navigationBarHidden(true)
        }
//        .onAppear() {
//            exchangeRateViewModel.sendingCountry = units[remittance]
//            exchangeRateViewModel.gettingCountry = units[reception]
//            exchangeRateViewModel.calculate()
//            exportDate()
//        }
    }
}

struct ExchangeRateView_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeRateView()
    }
}
