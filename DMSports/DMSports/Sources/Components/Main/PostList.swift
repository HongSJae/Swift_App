import SwiftUI

struct PostAlready {
    var voteID: Int
    var already = false
}

struct PostList: View {
    @Binding var sportType: String
    let postAlready: PostAlready
    let voteList: VoteListStruct
    let action1: () -> Void
    let action2: () -> Void
    let action3: () -> Void
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text(sportType)
                        .font(.custom("Inter-SemiBold", size: 18))
                        .foregroundColor(.black)
                        .padding(.bottom, 5)
                    Text("\(voteList.voteCount)/\(voteList.maxPeople)명")
                        .font(.custom("Inter-SemiBold", size: 16))
                        .foregroundColor(.hint)
                        .padding(.bottom, 4)
                }
                Spacer()
                Text(voteList.time.rawValue)
                    .font(.custom("Inter-SemiBold", size: 18))
                    .foregroundColor(.hint)
                    .padding(.trailing, 8)
            }
            .padding(.bottom, 4)
            ProgressView(value: Double(voteList.voteCount),
                         total: Double(voteList.maxPeople))
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
                switch voteList.isComplete {
                case true:
                    Text("마감되었어요")
                        .font(.custom("Inter-Regular", size: 14))
                        .foregroundColor(.hint)
                        .padding(.trailing, 4)
                case false:
//                    Text("\(timeLeft) 남음")
//                        .font(.custom("Inter-Medium", size: 10))
//                        .foregroundColor(.hint)
                    Button {
                        if !UserDefaults.standard.bool(
                            forKey: "already" + String(postAlready.voteID)) {
                            action2()
                        } else {
                            action3()
                        }
                        UserDefaults.standard.set(
                            !UserDefaults.standard.bool(
                                forKey: "already" + String(postAlready.voteID)),
                            forKey: "already" + String(postAlready.voteID)
                        )
                    } label: {
                        Text(UserDefaults.standard.bool(
                            forKey: "already" + String(postAlready.voteID)) ? "취소" : "신청")
                            .font(.custom("Inter-SemiBold", size: 18))
                            .foregroundColor(.white)
                            .padding(.vertical, 9)
                            .padding(.horizontal, 23)
                            .background(UserDefaults.standard.bool(
                                forKey: "already" + String(postAlready.voteID)) ? Color.disabledColor : Color.primary1)
                            .cornerRadius(20)
                    }
                }
            }
            .padding(.top, 8)
        }
        .padding(.leading, 16)
        .padding(.top, 12)
        .padding(.bottom, voteList.isComplete ? 16 : 8)
        .padding(.trailing, voteList.isComplete ? 16 : 8)
        .background(voteList.isComplete ? Color.disabledColor : Color.white)
        .cornerRadius(20)
        .onAppear {
            if !UserDefaults.standard.bool(
                forKey: "already" + String(postAlready.voteID)) {
                UserDefaults.standard.set(
                    postAlready.already,
                    forKey: "already" + String(postAlready.voteID)
                )
            }
        }
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostList(sportType: .constant("sadfads"),
                 postAlready: PostAlready(voteID: 0),
                 voteList: VoteListStruct(
                    voteID: 0,
                    time: .DINNER,
                    voteCount: 0,
                    maxPeople: 0,
                    isComplete: false,
                    voteUser: []),
                 action1: { print("hello") },
                 action2: { print("helloHello") },
                 action3: {})
    }
}
