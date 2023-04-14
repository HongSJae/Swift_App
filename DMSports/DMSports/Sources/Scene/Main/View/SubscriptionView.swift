import SwiftUI

struct SubscriptionView: View {
    @Binding var close: Bool
    let sport: Club
    let action: () -> Void
    private func changeList() -> [String] {
        switch sport {
        case .BADMINTON:
            return ["nil"]
        case .SOCCER:
            return [
                "C.F",
                "S.F",
                "L.W",
                "C.M",
                "R.W",
                "A.M",
                "D.M",
                "R.S.T",
                "L.S.T",
                "S.W",
                "G.K"
            ]
        case .BASKETBALL:
            return [
                "P.G",
                "S.G",
                "S.F",
                "P.F",
                "C"
            ]
        case .VOLLEYBALL:
            return [
                "Right",
                "Left",
                "Center",
                "Libero"
            ]
        }
    }
    var body: some View {
        ZStack {
            Color.base.ignoresSafeArea()
            VStack(alignment: .leading) {
                Button {
                    close.toggle()
                } label: {
                    Image("Back")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .padding(.vertical, 16)
                }
                Text("포지션 선택")
                    .font(.custom("Inter-SemiBold", size: 20))
                    .foregroundColor(.hint)
                    .padding(.bottom, 16)
                ScrollView {
                    ForEach (changeList(), id: \.self) { data in
                        HStack {
                            Text(data)
                                .padding(.leading, 20)
                                .padding(.vertical, 17)
                            Spacer()
                            Button {
                                action()
                            } label: {
                                Text("신청")
                                    .font(.custom("Inter-SemiBold", size: 18))
                                    .foregroundColor(.white)
                                    .padding(.vertical, 9)
                                    .padding(.horizontal, 23)
                                    .background(Color.primary1)
                                    .cornerRadius(20)
                                    .padding(.trailing, 8)
                            }
                        }
                        .background(Color.white)
                        .cornerRadius(20)
                    }
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

struct SubscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionView(close: .constant(true),
                         sport: .BADMINTON,
                         action: { })
    }
}
