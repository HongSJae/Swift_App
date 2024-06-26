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
    @State private var showPlayerList = false
    @State private var showEdit = false
    @State private var showDelete = false
    @State private var voteUser: [VoteUserStruct] = []
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 0) {
                Spacer()
                ZStack(alignment: .bottom) {
                    ShowView(tabIndex: $tabIndex,
                             showPlayerList: $showPlayerList,
                             showEdit: $showEdit,
                             showDelete: $showDelete,
                             voteUser: $voteUser)
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
                        .opacity(showPlayerList
                                 || showEdit
                                 || showDelete
                                 ? 0.2 : 0)
                        .ignoresSafeArea()
                }
                .popup(isPresented: $showPlayerList, type: .default, position: .bottom, animation: .default, autohideIn: nil, dragToDismiss: true, closeOnTap: false, closeOnTapOutside: true, view: {
                    PlayerListPopUpView(close: $showPlayerList,
                                        ATeam: voteUser,
                                        BTeam: voteUser)
                        .padding(.horizontal, 16)
                })
                .popup(isPresented: $showEdit, type: .default, position: .bottom, animation: .default, autohideIn: nil, dragToDismiss: true, closeOnTap: false, closeOnTapOutside: true, view: {
                    EditNoticeView(edit: {},
                                   close: {
                        showEdit = false})
                    .padding(.horizontal, 16)
                })
                .popup(isPresented: $showDelete, type: .default, position: .bottom, animation: .default, autohideIn: nil, dragToDismiss: true, closeOnTap: false, closeOnTapOutside: true, view: {
                    DeleteNoticeView(close: {
                        showDelete = false},
                                     delete: {})
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
