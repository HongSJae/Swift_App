import SwiftUI

struct PasswordTextfield: View {
    @Binding var text: String
    @Binding var isSee: Bool
    let placeHolder: String
    private func formEmail() -> Bool {
        return text.contains("@dsm.hs.kr")
    }
    private func eye() -> some View {
        return Button {
            self.isSee.toggle()
        } label: {
            switch isSee {
            case true:
                Image("Seeing PW")
                    .resizable()
                    .frame(width: 25, height: 20)
            case false:
                Image("Unseeing PW")
                    .resizable()
                    .frame(width: 25, height: 20)
            }
        }

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
            SecureField(placeHolder, text: $text)
                .foregroundColor(.black)
                .font(.custom("Inter-Regular", size: 16))
            check()
            eye()
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

struct PasswordTextfield_Previews: PreviewProvider {
    static var previews: some View {
        PasswordTextfield(text: .constant(""),
                          isSee: .constant(true),
                           placeHolder: "비밀번호")
    }
}
