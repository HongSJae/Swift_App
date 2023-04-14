import SwiftUI

struct PasswordTextfield: View {
    @Binding var text: String
    @Binding var isSee: Bool
    let placeHolder: String
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
    private func passwordTest() -> Bool {
        return self.text.count >= 8 && self.text.count <= 20
    }
    var body: some View {
        HStack {
            switch isSee {
            case true:
                TextField(placeHolder, text: $text)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .foregroundColor(.black)
                    .font(.custom("Inter-Regular", size: 16))
            case false:
                SecureField(placeHolder, text: $text)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .foregroundColor(.black)
                    .font(.custom("Inter-Regular", size: 16))
            }
            if passwordTest() {
                Image("Format OK")
                    .resizable()
                    .frame(width: 25, height: 20)
            }
            eye()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(style: .init(lineWidth: 1))
                .foregroundColor(passwordTest() ? .primary2 : .hint)
        )
    }
}

struct PasswordTextfield_Previews: PreviewProvider {
    static var previews: some View {
        PasswordTextfield(text: .constant("afsdfasdf"),
                          isSee: .constant(false),
                           placeHolder: "비밀번호")
    }
}
