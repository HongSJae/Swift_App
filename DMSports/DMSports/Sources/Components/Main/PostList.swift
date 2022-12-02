import SwiftUI

struct PostList: View {
    @Binding var text: String
    let time: String
    let maxAmount: Int
    let miniAmount: Int
    let timeLeft: String
    let end: Bool
    let already: Bool
    let action1: () -> Void
    let action2: () -> Void
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text(text)
                        .font(.custom("Inter-SemiBold", size: 18))
                        .foregroundColor(.black)
                        .padding(.bottom, 5)
                    Text("\(miniAmount)/\(maxAmount)명")
                        .font(.custom("Inter-SemiBold", size: 16))
                        .foregroundColor(.hint)
                        .padding(.bottom, 4)
                }
                Spacer()
                Text(time)
                    .font(.custom("Inter-SemiBold", size: 18))
                    .foregroundColor(.hint)
            }
            .padding(.bottom, 4)
            ProgressView(value: Double(miniAmount), total: Double(maxAmount))
                .progressViewStyle(.linear)
                .accentColor(.primary1)
                .scaleEffect(x: 1, y: 3, anchor: .center)
                .padding(.bottom, 8)
            HStack {
                Button {
                    action1()
                } label: {
                    Text("신청자 목록 보기")
                        .font(.custom("Inter-Regular", size: 14))
                        .foregroundColor(.white)
                        .padding(.vertical, 2)
                        .padding(.horizontal, 8)
                        .background(Color.primary1)
                        .cornerRadius(20)
                }
                Spacer()
                switch end {
                case true:
                    Text("마감되었어요")
                        .font(.custom("Inter-Regular", size: 14))
                        .foregroundColor(.hint)
                        .padding(.trailing, 4)
                case false:
                    Text("\(timeLeft) 남음")
                        .font(.custom("Inter-Medium", size: 10))
                        .foregroundColor(.hint)
                    Button {
                        if !already { action2() }
                    } label: {
                        Text(already ? "완료" : "신청")
                            .font(.custom("Inter-SemiBold", size: 18))
                            .foregroundColor(.white)
                            .padding(.vertical, 9)
                            .padding(.horizontal, 23)
                            .background(already ? Color.disabledColor : Color.primary1)
                            .cornerRadius(20)
                    }
                }
            }
            .padding(.top, 8)
        }
        .padding(.leading, 16)
        .padding(.top, 12)
        .padding(.bottom, end ? 16 : 8)
        .padding(.trailing, end ? 16 : 8)
        .background(end ? Color.disabledColor : Color.white)
        .cornerRadius(20)
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostList(text: .constant("배드민턴"),
                 time: "점심시간",
                 maxAmount: 4,
                 miniAmount: 2,
                 timeLeft: "11:11",
                 end: false,
                 already: true,
                 action1: { print("hello") },
                 action2: { print("helloHello") })
    }
}
