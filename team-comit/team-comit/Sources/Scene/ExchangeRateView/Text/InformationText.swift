import SwiftUI

struct InformationText: View {
    @Environment(\.colorScheme) var scheme
    let firstText: String
    let secondText: String
    
    var body: some View {
        HStack {
            Text(firstText)
                .foregroundColor(Theme.fontColor(forScheme: scheme))
                .font(.system(size: 18))
                .fontWeight(.regular)
            Spacer()
            Text(secondText)
                .foregroundColor(Theme.fontColor(forScheme: scheme))
                .font(.system(size: 18))
                .fontWeight(.regular)
        }
    }
}

struct InformationText_Previews: PreviewProvider {
    static var previews: some View {
        InformationText(firstText: "송금 국가", secondText: "미국(USD)")
    }
}
