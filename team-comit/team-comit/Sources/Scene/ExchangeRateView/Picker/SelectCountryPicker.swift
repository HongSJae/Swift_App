import SwiftUI

struct SelectCountryPicker: View {
    @Binding var selected: Int
    @StateObject var exchangeRateViewModel = ExchangeRateViewModel()
    let countrys: [String]
    var body: some View {
        VStack {
            Picker("", selection: $selected) {
                ForEach(0..<countrys.count, id: \.self) { i in
                    Button {
                        print("hi", countrys[i])
                    } label: {
                        Text(countrys[i])
                            .font(.headline)
                            .foregroundColor(.black)
                    }
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
