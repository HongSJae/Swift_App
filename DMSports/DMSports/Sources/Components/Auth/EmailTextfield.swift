import SwiftUI

struct EmailTextfield: View {
    @Binding var text: String
    private func emailTest() -> Bool {
        return self.text.contains("@dsm.hs.kr")
    }
    let placeHolder: String
    var body: some View {
        HStack {
            TextField(placeHolder, text: $text)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .foregroundColor(.black)
                .font(.custom("Inter-Regular", size: 16))
            if emailTest() {
                Image("Format OK")
                    .resizable()
                    .frame(width: 25, height: 20)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(style: .init(lineWidth: 1))
                .foregroundColor(emailTest() ? .primary2 : .hint)
        )
    }
}

struct EmailTextfield_Previews: PreviewProvider {
    static var previews: some View {
        EmailTextfield(text: .constant("gtw030488@dsm.hs.kr"),
                       placeHolder: "이메일")
    }
}
