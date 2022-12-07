import Foundation

// MARK: - RecentNoticeModel
struct RecentNoticeModel: Codable {
    let manager, admin: [Admin]
}

// MARK: - Admin
struct Admin: Codable {
    let id: Int
    let title, contentPreview, createdAt: String
    let type: Notice.RawValue

    enum CodingKeys: String, CodingKey {
        case id, title
        case contentPreview = "content_preview"
        case type
        case createdAt = "created_at"
    }
}

// MARK: - RecentNoticeModel
struct RecentNoticeModelStruct: Hashable {
    let manager, admin: [AdminStruct]
}

// MARK: - Admin
struct AdminStruct: Hashable {
    let id: Int
    let title, contentPreview, createdAt: String
    let type: Notice.RawValue
}
