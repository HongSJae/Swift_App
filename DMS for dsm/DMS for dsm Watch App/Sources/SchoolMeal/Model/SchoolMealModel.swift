import Foundation

// MARK: - SchoolMealModel
struct SchoolMealModel: Codable {
    let menu: [Menu]
}

// MARK: - Menu
struct Menu: Codable {
    let date: String
    let breakfast, lunch, dinner: [String]
}

// MARK: - Menu
struct MenuStruct: Hashable {
    let date: String
    let breakfast, lunch, dinner: [String]
}

