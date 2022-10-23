import SwiftUI

struct SelectCountryPicker: View {
    @Environment(\.colorScheme) var scheme
    @Binding var selected: Int
    @StateObject var exchangeRateViewModel = ExchangeRateViewModel()
    let countrys: [String]
    var body: some View {
        VStack {
            Picker("국가를 선택해주세요", selection: $selected) {
                ForEach(0..<countrys.count, id: \.self) { i in
                    Text(countrys[i])
                        .accentColor(Theme.fontColor(forScheme: scheme))
                        .tag(i)
                }
            }
            .pickerStyle(.menu)
            .frame(height: 20)
        }
    }
}

struct SelectCountryPicker_Previews: PreviewProvider {
    static var previews: some View {
        SelectCountryPicker(selected: .constant(1), countrys: [
            "한국(KRW)",
            "미국(USD)",
            "일본(JPY)",
            "필리핀(PHP)",
        ]
)
    }
}
