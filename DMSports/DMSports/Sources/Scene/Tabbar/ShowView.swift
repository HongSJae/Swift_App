import SwiftUI
struct ShowView: View {
    @Binding var tabIndex: TabIndex
    @Binding var shouldShowToast: Bool
    var body: some View {
        VStack {
            switch tabIndex {
            case .main:
                MainView(shouldShowToast: $shouldShowToast)
            case .notice:
                EmptyView()
            case .my:
                EmptyView()
            }
        }
    }
}

 struct ShowView_Previews: PreviewProvider {
    static var previews: some View {
        ShowView(tabIndex: .constant(.main), shouldShowToast: .constant(false))
    }
 }
