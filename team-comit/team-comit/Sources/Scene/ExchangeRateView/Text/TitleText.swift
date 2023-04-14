import SwiftUI

struct TitleText: View {
    @Environment(\.colorScheme) var scheme
    var body: some View {
        Text("환율 계산")
            .foregroundColor(Theme.fontColor(forScheme: scheme))
            .font(.system(size: 36))
            .fontWeight(.regular)
            .padding(.vertical, 60)
    }
}

struct TitleText_Previews: PreviewProvider {
    static var previews: some View {
        TitleText()
    }
}
