import SwiftUI

struct EmailVerifyView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var email: String = ""
    @State private var verify: String = ""
    @State private var visible: Bool = false
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading, spacing: 0) {
                Button {
                    dismiss()
                } label: {
                    Image("Back")
                        .resizable()
                        .frame(width: 16, height: 16)
                }
                Spacer()
                Text("인증하기")
                    .foregroundColor(.primary1)
                    .font(.custom("Inter-Bold", size: 48))
                Text("DMSport.")
                    .foregroundColor(.primary2)
                    .font(.custom("Inter-Bold", size: 32))
                Spacer()
                    .frame(height: 42)
                HStack(spacing: 16) {
                    EmailTextfield(text: $email,
                                   placeHolder: "이메일")
                    Button {
                        print("인증")
                    } label: {
                        Text("인증")
                            .foregroundColor(.white)
                            .font(.custom("Inter-SemiBold", size: 18))
                            .padding(.vertical, 13)
                            .frame(width: 80)
                            .background(Color.primary1)
                            .cornerRadius(20)
                    }
                }
                Spacer()
                    .frame(height: 32)
                TextField("인증번호", text: $verify)
                    .foregroundColor(.black)
                    .font(.custom("Inter-Regular", size: 16))
                    .padding(.horizontal, 16)
                    .padding(.vertical, 14)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(style: .init(lineWidth: 1))
                            .foregroundColor(.hint)
                    )
                Group {
                    Spacer()
                    Spacer()
                }
                NavigationLink(destination: SignInView()) {
                    Text("완료")
                        .foregroundColor(.white)
                        .font(.custom("Inter-SemiBold", size: 18))
                        .padding(.vertical, 13)
                        .frame(width: proxy.size.width - 32)
                        .background(Color.primary1)
                        .cornerRadius(20)
                        .padding(.bottom, 12)
                }
            }
            .navigationBarHidden(true)
            .padding(.horizontal, 16)
        }
    }
}
struct EmailVerifyView_Previews: PreviewProvider {
    static var previews: some View {
        EmailVerifyView()
    }
}
