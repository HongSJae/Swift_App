import SwiftUI

struct NoticeForm: View {
    @State private var sheetDetail = false
    @State private var showEdit = false
    @State private var showDelete = false
    let proxy: GeometryProxy
    let admin: AdminStruct
    var body: some View {
        Button {
            sheetDetail = true
        } label: {
            VStack(alignment: .leading) {
                HStack(alignment: .bottom, spacing: 0) {
                    Text(admin.title)
                        .font(.custom("Inter-SemiBold", size: 18))
                        .foregroundColor(.black)
                        .lineLimit(1)
                    Text("\(admin.type) / \(admin.createdAt)")
                        .font(.custom("Inter-Medium", size: 10))
                        .foregroundColor(.hint)
                        .padding(.leading, 4)
                        .padding(.bottom, 3)
                    Spacer()
                }
                Text(admin.contentPreview)
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
                                 title: admin.title,
                                 content: admin.contentPreview,
                                 date: admin.createdAt)
            })
        }
    }
}

//struct NoticeForm_Previews: PreviewProvider {
//    static var previews: some View {
//        NoticeForm(proxy: 1234)
//    }
//}
