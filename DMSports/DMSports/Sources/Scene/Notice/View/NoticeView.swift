import SwiftUI

enum NoticeType {
    case event
    case all
}

struct NoticeView: View {
    @State private var shouldShowModalAllNotice: Bool = false
    @State private var shouldShowModalEventNotice: Bool = false
    @Binding var shouldShowPopUpDelete: Bool
    @Binding var shouldShowPopUpEdit: Bool
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color.primary0.ignoresSafeArea()
                ZStack(alignment: .top) {
                    Color.base.ignoresSafeArea()
                    VStack(alignment: .leading, spacing: 12) {
                        HStack(alignment: .bottom, spacing: 0) {
                            Text("전체 공지사항")
                                .font(.custom("Inter-SemiBold", size: 20))
                                .foregroundColor(.hint)
                                .padding(.top, 20)
                                .padding(.leading, 12)
                            Spacer()
                            Button {
                                shouldShowModalAllNotice = true
                            } label: {
                                Text("전체 공지사항 더 보기 >")
                                    .font(.custom("Inter-Regular", size: 14))
                                    .foregroundColor(.hint)
                                    .padding(.top, 20)
                            }
                        }
                        NoticeForm(proxy: proxy)
                        NoticeForm(proxy: proxy)
                        HStack(alignment: .bottom, spacing: 0) {
                            Text("종목별 공지사항")
                                .font(.custom("Inter-SemiBold", size: 20))
                                .foregroundColor(.hint)
                                .padding(.top, 20)
                                .padding(.leading, 12)
                            Spacer()
                            Button {
                                shouldShowModalEventNotice = true
                            } label: {
                                Text("종목별 공지사항 더 보기 >")
                                    .font(.custom("Inter-Regular", size: 14))
                                    .foregroundColor(.hint)
                                    .padding(.top, 20)
                                
                            }
                        }
                        EditableNoticeForm(edit: {
                            withAnimation {
                                shouldShowPopUpEdit = true
                            }},
                                           delete: {
                            withAnimation {
                                shouldShowPopUpDelete = true
                            }
                        },
                                           proxy: proxy)
                        EditableNoticeForm(edit: {
                            withAnimation {
                                shouldShowPopUpEdit = true
                            }
                        },
                                           delete: {
                            withAnimation {
                                shouldShowPopUpDelete = true
                            }
                        },
                                           proxy: proxy)
                    }
                    .padding(.horizontal, 16)
                }
                .cornerRadius(20, corners: .topLeft)
                .cornerRadius(20, corners: .topRight)
                .padding(.top, proxy.size.height / 9)
                .sheet(isPresented: $shouldShowModalAllNotice, content: {
                    NoticeListView(close: $shouldShowModalAllNotice,
                                     title: "전체 공지사항")
                })
                .sheet(isPresented: $shouldShowModalEventNotice, content: {
                    NoticeListView(close: $shouldShowModalEventNotice,
                                     title: "종목 공지사항")
                })
            }
        }
    }
}

struct NoticeView_Previews: PreviewProvider {
    static var previews: some View {
        NoticeView(shouldShowPopUpDelete: .constant(false),
                   shouldShowPopUpEdit: .constant(false))
    }
}
