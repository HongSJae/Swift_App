import SwiftUI

struct InformationText: View {
    @Environment(\.colorScheme) var scheme
    let titleText: String
    let valueText: String
    
    var body: some View {
        HStack {
            Text(titleText)
                .foregroundColor(Theme.fontColor(forScheme: scheme))
                .font(.system(size: 18))
                .fontWeight(.regular)
            Spacer()
            Text(valueText)
                .foregroundColor(Theme.fontColor(forScheme: scheme))
                .font(.system(size: 18))
                .fontWeight(.regular)
        }
    }
}

struct InformationText_Previews: PreviewProvider {
    static var previews: some View {
        InformationText(titleText: "송금 국가", valueText: "미국(USD)")
    }
}
