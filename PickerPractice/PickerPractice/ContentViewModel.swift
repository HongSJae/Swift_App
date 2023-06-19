import SwiftUI
import AVFoundation
import Photos

class ContentViewModel : ObservableObject {
    @Published var permissionGranted = false

    func requestCameraPermission() {
        AVCaptureDevice.requestAccess(for: .video, completionHandler: { (granted: Bool) in
            if granted {
                print("Camera: 권한 허용")
            } else {
                print("Camera: 권한 거부")
            }
        })
    }

    func requestLibPermission() {
        PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
            switch status {
            case .notDetermined:
                print("아직 사용자가 앱의 접근을 결정하지 않았음.")
            case .restricted:
                print("시스템이 앱의 접근을 제한함")
            case .denied:
                print("사용자가 명시적으로 앱의 접근을 거부함 ㅠ")
            case .authorized:
                print("사용자가 사진첩의 데이터에 접근을 허가함")
            case .limited:
                print("사용자가 사진첩의 접근을 허가하지만, 제한된 사진들만 가능.")
            @unknown default:
                fatalError()
            }
        }
    }
}
