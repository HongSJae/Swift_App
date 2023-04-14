
import UIKit
import Firebase
import FirebaseStorage

class UploadViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onBtnUpload(_ sender: UIButton) {
        UploadImage()
    }
    
    func UploadImage() {
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let data = imageView.image!.pngData()
    
        //타임 스탬프
        let timeStamp = Int(NSDate.timeIntervalSinceReferenceDate*1000)
        let imageFileName = "idol" + String(timeStamp) + ".png"
        
        let serverImageRef = storageRef.child(imageFileName)
        
        //Meta Data 추가
        let metadata = StorageMetadata()
        metadata.contentType = "image/png"
        
        let uploadTask = serverImageRef.putData(data!, metadata: metadata) {
            metadata, err in
            guard metadata != nil else {
                print("업로드 실패 :(")
                self.textView.text.append("\n업로드 실패함 :(")
                return
            }
            print("업로드 성공 :)")
            self.textView.text.append("\n업로드 성공함 :)")
            
            //Download URL
            serverImageRef.downloadURL() {
                url, err  in
                guard let downloadURL = url else {
                    return
                }
                self.textView.text.append("\n\(downloadURL.absoluteURL)")
                print("uploadURL: ", downloadURL.absoluteURL)
                
                //DB에 쓰기 기능 추가함
            }
        }
    }
    
}
    
