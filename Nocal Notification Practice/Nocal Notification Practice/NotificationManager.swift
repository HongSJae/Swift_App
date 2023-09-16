import UIKit
import UserNotifications

class NotificationManager: ObservableObject {
    
    let notiCenter = UNUserNotificationCenter.current()
    
    @Published var isToggleOn: Bool = UserDefaults.standard.bool(forKey: "hasUserAgreedNoti") {
        didSet {
            let key = "hasUserAgreedNoti"
            if isToggleOn {
                // On Action - 1
                UserDefaults.standard.set(true, forKey: key)
                requestNotiAuthorization()
            }
            else {
                // Off Action - 2
                UserDefaults.standard.set(false, forKey: key)
                removeAllNotifications()
            }
        }
    }
    
    @Published var notiTime: Date = Date() {
        didSet {
            removeAllNotifications()
            addDateNoti()
        }
    }
    
    @Published var isAlertOccurred: Bool = false
    
    func removeAllNotifications() {
        notiCenter.removeAllDeliveredNotifications()
        notiCenter.removeAllPendingNotificationRequests()
    }
    
    func requestNotiAuthorization() {
        // 노티피케이션 설정을 가져오기
        // 상태에 따라 다른 액션 수행
        notiCenter.getNotificationSettings { settings in
            
            // 승인되어있지 않은 경우 request
            if settings.authorizationStatus != .authorized {
                self.notiCenter.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
                    if let error = error {
                        print("Error : \(error.localizedDescription)")
                    }
                    
                    // 노티피케이션 최초 승인
                    if granted {
                        self.addCalendarNoti()
                    }
                    // 노티피케이션 최초 거부
                    else {
                        DispatchQueue.main.async {
                            self.isToggleOn = false
                        }
                    }
                }
            }
            
            // 거부되어있는 경우 alert
            if settings.authorizationStatus == .denied {
                // 알림 띄운 뒤 설정 창으로 이동
                DispatchQueue.main.async {
                    self.isAlertOccurred = true
                }
            }
        }
    }
    
    func removeBadge() {
        UIApplication.shared.applicationIconBadgeNumber = 0
    }
    
    func addNotification(by date: DateComponents) {
        let id = UUID().uuidString
        // content 만들기
        let content = UNMutableNotificationContent()
        content.title = "알림 제목입니다"
        content.body = "알림 바디입니다. 여기 내용이 들어갑니다."
        content.sound = .default
        content.badge = ((content.badge?.intValue ?? 0) + 1) as NSNumber
        
        // trigger 만들기
        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
        
        // request 만들기
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        
        print(date)
        notiCenter.add(request, withCompletionHandler: nil)
    }
    
    func addDateNoti() {
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute, .second], from: notiTime)
        self.addNotification(by: components)
    }
    
    func addCalendarNoti() {
        
        let calendar = Calendar.current
        let newDate = calendar.date(byAdding: DateComponents(second: 3), to: .now)
        let components = calendar.dateComponents([.hour, .minute, .second], from: newDate!)
        self.addNotification(by: components)
    }
    
    func openSettings() {
        if let bundle = Bundle.main.bundleIdentifier,
           let settings = URL(string: UIApplication.openSettingsURLString + bundle) {
            if UIApplication.shared.canOpenURL(settings) {
                UIApplication.shared.open(settings)
            }
        }
    }
}
