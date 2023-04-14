import SwiftUI

struct DealText: View {
    @Environment(\.colorScheme) var scheme
    @Binding var pickerValue: Int
    let titleText: String
    let countrys: [String]
    
    var body: some View {
        HStack {
            Text(titleText)
                .foregroundColor(Theme.fontColor(forScheme: scheme))
                .font(.system(size: 18))
                .fontWeight(.regular)
            Spacer()
            SelectCountryPicker(selected: $pickerValue, countrys: countrys)
        }
    }
}

struct DealText_Previews: PreviewProvider {
    static var previews: some View {
        DealText(pickerValue: .constant(0), titleText: "송금국가", countrys: [
            "한국(KRW)",
            "미국(USD)",
            "일본(JPY)",
            "필리핀(PHP)",
        ])
    }
}
