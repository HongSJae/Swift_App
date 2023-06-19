import SwiftUI

struct ContentView: View {
    @State private var items: [String] = Array(1...20).map { "Item \($0)" }
    @State private var isAtBottom = false

    var body: some View {
        ScrollViewReader { scrollViewProxy in
            ScrollView {
                LazyVStack {
                    ForEach(items, id: \.self) { item in
                        Text(item)
                            .frame(height: 50)
                            .id(item)
                    }
                }
                .onChange(of: isAtBottom) { newValue in
                    // 맨 마지막이 뷰에 나왔을 때 실행할 작업
                    if newValue {
                        print("맨 마지막이 뷰에 나왔습니다.")
                        // 추가 작업 수행
                    }
                }
                .onAppear {
                    // 스크롤 뷰의 맨 아래로 스크롤
                    scrollViewProxy.scrollTo(items.last, anchor: .bottom)
                }
                .overlay(
                    GeometryReader { proxy in
                        Color.clear
                            .preference(key: ScrollViewOffsetPreferenceKey.self, value: proxy.frame(in: .named("scroll")).maxY)
                    }
                    .onPreferenceChange(ScrollViewOffsetPreferenceKey.self) { offsetY in
                        // 스크롤 뷰의 Y 오프셋을 확인하여 맨 마지막인지 여부를 감지
                        let scrollViewHeight = scrollViewProxy.frame(in: .global).height
                        let contentHeight = offsetY + scrollViewHeight
                        let isAtBottom = contentHeight >= scrollViewProxy.size.height
                        self.isAtBottom = isAtBottom
                    }
                )
            }
            .coordinateSpace(name: "scroll")
        }
    }
}

struct ScrollViewOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
