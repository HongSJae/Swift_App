import SwiftUI

struct ChangedExchangeRateView: View {
    var body: some View {
        VStack(spacing: 0) {
            DismissButton()
            .padding(.leading, 24.35)
            .padding(.vertical, 14)
            ResultText(exchangeRate: "113,004.98")
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

struct ChangedExchangeRateView_Previews: PreviewProvider {
    static var previews: some View {
        ChangedExchangeRateView()
    }
}
