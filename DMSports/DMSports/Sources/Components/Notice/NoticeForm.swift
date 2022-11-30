import SwiftUI

enum User {
    case user
    case admin
    case manager
}

struct NoticeForm: View {
    @State private var sheetDetail = false
    @State private var showEdit = false
    @State private var showDelete = false
    let title: String = "준수야 그러면 안된다."
    let content: String = "준수야 그러면 안돼, 준수야 그러면 안돼, 장지성 아님"
    let date: String = "22시간 전"
    let proxy: GeometryProxy
    var body: some View {
        Button {
            sheetDetail = true
        } label: {
            VStack(alignment: .leading) {
                HStack(alignment: .bottom, spacing: 0) {
                    Text("MMMMMMMMMMMMMMMM")
                        .font(.custom("Inter-SemiBold", size: 18))
                        .foregroundColor(.black)
                        .lineLimit(1)
                    Text("종목 / 방금전")
                        .font(.custom("Inter-Medium", size: 10))
                        .foregroundColor(.hint)
                        .padding(.leading, 4)
                        .padding(.bottom, 3)
                    Spacer()
                }
                Text("안될꺼 머있노안될꺼 머있노안될꺼 머있노안될꺼 머있노안될꺼 머있노안될꺼 머있노안될꺼 머있노안될꺼 머있노안될꺼 머있노안될꺼 머있노안될꺼 머있노안될꺼 머있노안될꺼 머있노안될꺼 머있노안될꺼 머있노안될꺼 머있노안될꺼 머있노안될꺼 머있노안될꺼 머있노")
                    .font(.custom("Inter-Regular", size: 14))
                    .foregroundColor(.hint)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .frame(width: proxy.size.width - 32,
                   height: proxy.size.height / 6.5)
            .background(Color.white)
            .cornerRadius(20)
            .sheet(isPresented: self.$sheetDetail, content: {
                NoticeDetailView(close: $sheetDetail,
                                 showEdit: $showEdit,
                                 showDelete: $showDelete,
                                 title: title,
                                 content: content,
                                 date: date)
            })
        }
    }
}

//struct NoticeForm_Previews: PreviewProvider {
//    static var previews: some View {
//        NoticeForm(proxy: 1234)
//    }
//}
