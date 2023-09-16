import SwiftUI

struct NotiView: View {
    @ObservedObject private var notiManager = NotificationManager()

        var body: some View {
            HStack {
                Button("Alarm!!", action: notiManager.addCalendarNoti)

                Toggle("", isOn: $notiManager.isToggleOn)

                if notiManager.isToggleOn {
                    DatePicker("", selection: $notiManager.notiTime, displayedComponents: .hourAndMinute)
                }
            }
            .alert(isPresented: $notiManager.isAlertOccurred) {
                Alert(
                    title: Text("알림을 허용해주세요!"),
                    message: Text("알림을 허용해주지 않으시면 알람을 보낼 수 없어요."),
                    primaryButton: .cancel(),
                    secondaryButton: .destructive(Text("확인"), action: {
                        notiManager.openSettings()
                    })
                )
            }
            .onAppear {
                notiManager.removeBadge()
            }
    }
}
