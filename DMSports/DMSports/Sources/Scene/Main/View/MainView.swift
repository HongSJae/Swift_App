import SwiftUI

struct MainView: View {
    @StateObject var mainViewModel = MainViewModel()
    @State private var event: Club = .BADMINTON
    @State private var eventString: String = "배드민턴"
    @State private var shouldShowModal = false
    @Binding var shouldShowToast: Bool
    @Binding var voteID: Int
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color.primary0.ignoresSafeArea()
                VStack(spacing: 0) {
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
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                    .frame(width: proxy.size.width - 32)
                    .background(Color.white)
                    .cornerRadius(20)
                    .padding(.bottom, 16)
                    .padding(.top, proxy.size.height / 7)
                    ZStack(alignment: .top) {
                        Color.base.ignoresSafeArea()
                        VStack {
                            Spacer()
                            Text("2022/09/28 10:34 업데이트")
                                .font(.custom("Inter-Regular", size: 14))
                                .foregroundColor(.hint)
                                .padding(.bottom, 20)
                        }
                        VStack {
                            HStack {
                                Text("종목")
                                    .font(.custom("Inter-SemiBold", size: 20))
                                    .foregroundColor(.hint)
                                    .padding(.leading, 28)
                                Spacer()
                            }
                            ScrollView(.horizontal,
                                       showsIndicators: false) {
                                HStack(spacing: 8) {
                                    KindOfSportsButton(
                                        event: $event,
                                        sports: .BADMINTON)
                                    KindOfSportsButton(
                                        event: $event,
                                        sports: .SOCCER)
                                    KindOfSportsButton(
                                        event: $event,
                                        sports: .BASKETBALL)
                                    KindOfSportsButton(
                                        event: $event,
                                        sports: .VOLLEYBALL)
                                }
                                .padding(.horizontal, 12)
                            }
                            HStack {
                                Text("시간")
                                    .font(.custom("Inter-SemiBold", size: 20))
                                    .foregroundColor(.hint)
                                    .padding(.leading, 28)
                                Spacer()
                            }
                            if mainViewModel.checkVoteModel.voteList.isEmpty {
                                Text("오늘은 일정이 없어요")
                                    .font(.custom("Inter-Regular", size: 14))
                                    .foregroundColor(.hint)
                                    .padding(.top, 20)
                            } else {
                                ScrollView {
                                    VStack(spacing: 0) {
                                        ForEach (mainViewModel.checkVoteModel.voteList, id: \.self) { data in
                                            PostList(sportType: $eventString,
                                                      voteList: data,
                                                      action1: {
                                                withAnimation {
                                                    shouldShowToast = true
                                                }
                                            },
                                                      action2: {
                                                shouldShowModal = true
                                            })
                                            .padding(.bottom, 12)
                                            .padding(.horizontal, 16)
                                            .sheet(isPresented: self.$shouldShowModal) {
                                                SubscriptionView(close: $shouldShowModal,
                                                                 sport: event,
                                                                 action: {
                                                    mainViewModel.vote(userID: data.voteID)
                                                    print("신청 성공!")
                                                })
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        .onChange(of: event, perform: { newValue in
                            eventString = {
                                switch newValue {
                                case .BASKETBALL:
                                    return "농구"
                                case .SOCCER:
                                    return "축구"
                                case .BADMINTON:
                                    return "배드민턴"
                                case .VOLLEYBALL:
                                    return "배구"
                                }
                            }()
                            mainViewModel.type = event
                            mainViewModel.getCheckVote()
                        })
                        .padding(.top, 20)
                    }
                    .cornerRadius(20, corners: .topLeft)
                    .cornerRadius(20, corners: .topRight)
                }
            }
            .onAppear() {
                mainViewModel.getCheckVote()
            }
        }
    }
}

//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView(shouldShowToast: .constant(false))
//    }
//}
