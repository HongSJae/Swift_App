import SwiftUI
import UIKit

struct ContentView: View {
    @State private var showDocumentPicker = false
    @State private var selectedURL: URL?
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?

    var body: some View {
        VStack(spacing: 10) {
            Button("문서 선택") {
                showDocumentPicker = true
            }
            Text(selectedURL?.lastPathComponent ?? "선택된 파일 없음")
            Button("이미지 선택") {
                showImagePicker = true
            }
            Image(uiImage: selectedImage ?? .init())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .overlay {
                    Rectangle()
                        .stroke()
                        .fill(Color.blue)
                }
            Text(selectedImage?.description ?? "선택된 이미지가 없음")
        }
        .sheet(isPresented: $showDocumentPicker) {
            DocumentPicker(selectedURL: $selectedURL)
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: $selectedImage)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
