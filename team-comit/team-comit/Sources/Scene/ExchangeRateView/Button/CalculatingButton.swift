import SwiftUI

struct CalculatingButton: View {
    @Environment(\.colorScheme) var scheme
    @StateObject var VM = ExchangeRateViewModel()
    @Binding var nowDate: String
    let amount: String
    let unit_1: String
    let unit_2: String
    func exportDate() {
        let formatter_year = DateFormatter()
        formatter_year.dateFormat = "yyyy-MM-dd / HH:mm:ss"
        let current_year_string = formatter_year.string(from: Date())
        UserDefaults.standard.set(current_year_string, forKey: "date")
    }
    var body: some View {
        ZStack {
            NavigationLink(destination: ExchangedRateView(resultValue: $VM.exchangeRate, nowDate: $nowDate, unit: unit_1), tag: 1, selection: $VM.tag ) { EmptyView() }
            Button {
                VM.amount = amount
                VM.gettingCountry = unit_1
                VM.sendingCountry = unit_2
                VM.calculate()
                exportDate()
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
            .alert(isPresented: $VM.showingAlert) {
                        Alert(title: Text("송금액이 바르지 않습니다."), message: Text("송금액을 확인하고 다시 시도해주세요."), dismissButton: .default(Text("확인")))
                    }
        }
    }
}


struct CalculatingButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatingButton(nowDate: .constant("060304"), amount: "1", unit_1: "USD", unit_2: "KRW")
    }
}
