import SwiftUI

enum Sports {
    case 배드민턴
    case 축구
    case 농구
    case 배구
}

struct PostValue: Hashable {
    var text: String
    var time: String
    var maxAmount: Int
    var miniAmount: Int
    var timeLeft: String
    var end: Bool
    var already: Bool
}

struct MainView: View {
    @State private var event: Sports = .배드민턴
    @State private var shouldShowModal = false
    @Binding var shouldShowToast: Bool
    let postArr: [PostValue] = [
        PostValue(text: "배드민턴",
                  time: "점심시간",
                  maxAmount: 4,
                  miniAmount: 2,
                  timeLeft: "11:11",
                  end: false,
                  already: false),
        PostValue(text: "배드민턴",
                  time: "저녁시간",
                  maxAmount: 5,
                  miniAmount: 4,
                  timeLeft: "11:11",
                  end: false,
                  already: false),
        PostValue(text: "배드민턴",
                  time: "저녁시간",
                  maxAmount: 4,
                  miniAmount: 2,
                  timeLeft: "11:11",
                  end: true,
                  already: false)
    ]
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
                                        sports: .배드민턴)
                                    KindOfSportsButton(
                                        event: $event,
                                        sports: .축구)
                                    KindOfSportsButton(
                                        event: $event,
                                        sports: .농구)
                                    KindOfSportsButton(
                                        event: $event,
                                        sports: .배구)
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
                            if postArr.isEmpty {
                                Text("오늘은 일정이 없어요")
                                    .font(.custom("Inter-Regular", size: 14))
                                    .foregroundColor(.hint)
                                    .padding(.top, 20)
                            } else {
                                ScrollView {
                                    VStack(spacing: 0) {
                                        ForEach (postArr, id: \.self) { data in
                                            PostList (text: data.text,
                                                      time: data.time,
                                                      maxAmount: data.maxAmount,
                                                      miniAmount: data.miniAmount,
                                                      timeLeft: data.timeLeft,
                                                      end: data.end,
                                                      already: data.already,
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
                                        }
                                    }
                                }
                            }
                        }
                        .sheet(isPresented: self.$shouldShowModal) {
                            SubscriptionView(close: $shouldShowModal,
                                             sport: event,
                                             action: {
                                print("신청 성공!")
                            })
                        }
                        .padding(.top, 20)
                    }
                    .cornerRadius(20, corners: .topLeft)
                    .cornerRadius(20, corners: .topRight)
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(shouldShowToast: .constant(false))
    }
}
