import Foundation
import SwiftUI

struct Theme {
    static func fontColor(forScheme scheme: ColorScheme) -> Color {
        let lightColor = Color.black
        let darckColor = Color.white
        
        switch scheme {
        case .light : return lightColor
        case .dark : return darckColor
        @unknown default: return lightColor
        }
    }
}
