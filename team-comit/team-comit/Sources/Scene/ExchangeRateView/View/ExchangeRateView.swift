import SwiftUI

struct ExchangeRateView: View {
    @State private var amount: String = ""
    @StateObject var exchangeRateViewModel = ExchangeRateViewModel()
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                TitleText()
                InformationText(firstText: "송금국가", secondText: "미국(USD)")
                InformationText(firstText: "수취국가", secondText: "한국(KRW)")
                InformationText(firstText: "환율", secondText: "1,130.05 KRW / USD")
                InformationText(firstText: "조회시간", secondText: "2022-03-04 / 07:22:56")
                RemittanceAmountText(amount: $amount, unit: "USD")
                Spacer()
                CalculatingButton()
                    .onTapGesture {
                        exchangeRateViewModel.calculate()
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
    }
}

struct ExchangeRateView_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeRateView()
    }
}
