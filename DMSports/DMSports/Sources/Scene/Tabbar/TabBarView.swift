import SwiftUI
import PopupView

enum TabIndex {
    case main, notice, my
}

func getSafeAreaBot() -> Bool {
    let keyWindow = UIApplication.shared.connectedScenes
        .filter({$0.activationState == .foregroundActive})
        .map({$0 as? UIWindowScene})
        .compactMap({$0})
        .first?.windows
        .filter({$0.isKeyWindow}).first
    return (keyWindow?.safeAreaInsets.bottom) == 0
}

struct TabBarView: View {
    @State private var tabIndex = TabIndex.main
    @State private var showModal = false
    @State private var shouldShowToast: Bool = false
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 0) {
                Spacer()
                ZStack(alignment: .bottom) {
                    ShowView(tabIndex: $tabIndex, shouldShowToast: $shouldShowToast)
                        .padding(.bottom, getSafeAreaBot() ? 60 : 80)
                    ZStack {
                        VStack(spacing: 0) {
                            Rectangle()
                                .foregroundColor(.white)
                                .frame(width: proxy.size.width, height: getSafeAreaBot() ? 60 : 80)
                                .cornerRadius(20, corners: .topLeft)
                                .cornerRadius(20, corners: .topRight)
                        }
                        HStack(alignment: .top, spacing: 0) {
                            Spacer()
                            Button {
                                tabIndex = .main
                            } label: {
                                Image(tabIndex == .main ? "MainOn" : "MainOff")
                                    .resizable()
                                    .frame(width: 27, height: 29.21)
                            }
                            Spacer()
                            Button {
                                tabIndex = .notice
                            } label: {
                                Image(tabIndex == .notice ? "NoticeOn" : "NoticeOff")
                                    .resizable()
                                    .frame(width: 27, height: 27)
                            }
                            Spacer()
                            Button {
                                tabIndex = .my
                            } label: {
                                Image(tabIndex == .my ? "MyOn" : "MyOff")
                                    .resizable()
                                    .frame(width: 27, height: 28.5)
                            }
                            Spacer()
                        }
                        .padding(.bottom, getSafeAreaBot() ? 5 : 25)
                    }
                    Rectangle()
                        .opacity(shouldShowToast ? 0.2 : 0)
                        .ignoresSafeArea()
                }
                .popup(isPresented: $shouldShowToast, type: .default, position: .bottom, animation: .default, autohideIn: nil, dragToDismiss: true, closeOnTap: false, closeOnTapOutside: true, view: {
                    PlayerListPopUpView(close: $shouldShowToast)
                        .padding(.horizontal, 16)
                })
            }
            .navigationBarHidden(true)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
