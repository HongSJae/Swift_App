import SwiftUI

struct SignInView: View {
    @StateObject var signInViewModel = SignInViewModel()
    @State private var visible: Bool = false
    var body: some View {
        GeometryReader { proxy in
            NavigationLink(
                destination: TabBarView(),
                tag: 1,
                selection: $signInViewModel.viewTag
            ) { EmptyView() }
            VStack(alignment: .leading, spacing: 0) {
                Spacer()
                Text("로그인")
                    .foregroundColor(.primary1)
                    .font(.custom("Inter-Bold", size: 48))
                Text("DMSport.")
                    .foregroundColor(.primary2)
                    .font(.custom("Inter-Bold", size: 32))
                Spacer()
                    .frame(height: 42)
                EmailTextfield(text: $signInViewModel.email,
                                   placeHolder: "이메일")
                Spacer()
                    .frame(height: 32)
                PasswordTextfield(text: $signInViewModel.password,
                                  isSee: $visible,
                                  placeHolder: "비밀번호")
                HStack {
                    Spacer()
                    Text("비밀번호를 잊으셨나요?")
                        .foregroundColor(.primary2)
                        .font(.custom("Inter-Regular", size: 14))
                    Spacer()
                }
                .padding(.top, 48)
                Spacer()
                Group {
                    Button {
                        signInViewModel.login()
                    } label: {
                        Text("로그인")
                            .foregroundColor(.white)
                            .font(.custom("Inter-SemiBold", size: 18))
                            .padding(.vertical, 13)
                            .frame(width: proxy.size.width - 32)
                            .background(Color.primary1)
                            .cornerRadius(20)
                    }
                    Spacer()
                        .frame(height: 12)
                    NavigationLink(destination: SignUpView()) {
                        Text("가입하기")
                            .foregroundColor(.primary1)
                            .font(.custom("Inter-SemiBold", size: 18))
                            .padding(.vertical, 13)
                            .frame(width: proxy.size.width - 32)
                            .background(Color.white)
                            .cornerRadius(20)
                            .padding(1)
                            .background(Color.primary1)
                            .cornerRadius(20)
                    }
                    Spacer()
                        .frame(height: 12)
                }
            }
            .navigationBarHidden(true)
            .padding(.horizontal, 16)
            .alert("안내", isPresented: $signInViewModel.showError) {
                Button("확인", role: .cancel) { }
            } message: {
                Text(signInViewModel.errorMessage)
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
