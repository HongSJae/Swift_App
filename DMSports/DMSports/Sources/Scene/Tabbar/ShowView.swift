import SwiftUI
struct ShowView: View {
    @Binding var tabIndex: TabIndex
    @Binding var showPlayerList: Bool
    @Binding var showEdit: Bool
    @Binding var showDelete: Bool
    var body: some View {
        VStack {
            switch tabIndex {
            case .main:
                MainView(shouldShowToast: $showPlayerList)
            case .notice:
                NoticeView(shouldShowPopUpDelete: $showDelete,
                           shouldShowPopUpEdit: $showEdit)
            case .my:
                EmptyView()
            }
        }
    }
}

 struct ShowView_Previews: PreviewProvider {
    static var previews: some View {
        ShowView(tabIndex: .constant(.main),
                 showPlayerList: .constant(false),
                 showEdit: .constant(false),
                 showDelete: .constant(false))
    }
 }
