import SwiftUI

struct PlayerListPopUpView: View {
    @Binding var close: Bool
    let columns = [
        GridItem(.flexible(), spacing: 0, alignment: .leading),
        GridItem(.flexible(), spacing: 0, alignment: .leading)
    ]
    let humen = [
        "박박박", "이이이", "김김김", "길길길", "정정정", "조조조"
    ]
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("신청자 목록")
                    .font(.custom("Inter-SemiBold", size: 20))
                    .foregroundColor(.hint)
                    .padding(.bottom, 32)
                Text("1팀")
                    .font(.custom("Inter-Bold", size: 16))
                    .foregroundColor(.hint)
                    .padding(.bottom, 12)
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(humen, id: \.self) { data in
                        Text(data)
                            .font(.custom("Inter-Regular", size: 16))
                            .foregroundColor(.hint)
                    }
                }
                .padding(.bottom, 12)
                Text("2팀")
                    .font(.custom("Inter-Bold", size: 16))
                    .foregroundColor(.hint)
                    .padding(.bottom, 12)
                LazyVGrid(columns: columns) {
                    ForEach(humen, id: \.self) { data in
                        Text(data)
                            .font(.custom("Inter-Regular", size: 16))
                            .foregroundColor(.hint)
                    }
                }
                HStack {
                    Spacer()
                    Button {
                        close.toggle()
                    } label: {
                        Text("닫기")
                            .font(.custom("Inter-SemiBold", size: 20))
                            .foregroundColor(.hint)
                    }
                }
            }
            .padding(20)
            .background(Color.base)
            .cornerRadius(20)
        }
    }
}

struct PlayerListPopUpView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerListPopUpView(close: .constant(true))
    }
}
