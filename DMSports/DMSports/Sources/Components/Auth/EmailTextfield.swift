import SwiftUI

struct EmailTextfield: View {
    @Binding var text: String
    let placeHolder: String
    private func formEmail() -> Bool {
        return text.contains("@dsm.hs.kr")
    }
    private func check() -> some View {
        switch text.count >= 8 || text.count <= 20 {
        case true:
            return Image("Format OK")
                .resizable()
                .frame(width: 25, height: 20)
        case false:
            return Image("Format No")
                .resizable()
                .frame(width: 25, height: 20)
        }
    }
    var body: some View {
        HStack {
            TextField(placeHolder, text: $text)
                .foregroundColor(.black)
                .font(.custom("Inter-Regular", size: 16))
            check()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(style: .init(lineWidth: 1))
                .foregroundColor(formEmail() ? .primary2 : .hint)
        )
    }
}

struct EmailTextfield_Previews: PreviewProvider {
    static var previews: some View {
        EmailTextfield(text: .constant("gtw030488@dsm.hs.kr"),
                       placeHolder: "이메일")
    }
}
