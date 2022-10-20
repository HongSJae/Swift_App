import Foundation

// MARK: - ExchangeRateModel
struct ExchangeRateModel: Codable {
    let success: Bool
    let timestamp: Int
    let source: String
    let quotes: Quotes
}

// MARK: - Quotes
struct Quotes: Codable {
    let exchangedRate: Double

    enum CodingKeys: String, CodingKey {
        case exchangedRate = "USDKRW"
    }
}
