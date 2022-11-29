import SwiftUI

struct SignUpView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var name: String = ""
    @State private var password: String = ""
    @State private var visible1: Bool = false
    @State private var passwordCheck: String = ""
    @State private var visible2: Bool = false
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
                Text("시작하기")
                    .foregroundColor(.primary1)
                    .font(.custom("Inter-Bold", size: 48))
                Text("DMSport.")
                    .foregroundColor(.primary2)
                    .font(.custom("Inter-Bold", size: 32))
                    .padding(.bottom, 42)
                EmailTextfield(text: $name,
                               placeHolder: "이름(실명)")
                .padding(.bottom, 32)
                PasswordTextfield(text: $password,
                                  isSee: $visible1,
                                  placeHolder: "비밀번호를 입력해 주세요")
                .padding(.bottom, 32)
                PasswordTextfield(text: $password,
                                  isSee: $visible2,
                                  placeHolder: "비밀번호를 다시 입력해 주세요")
                Spacer()
                Spacer()
                NavigationLink(destination: EmailVerifyView()) {
                    Text("다음")
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

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
