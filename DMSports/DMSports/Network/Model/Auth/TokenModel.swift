import Foundation

// MARK: - TokenModal
struct TokenModel: Codable {
    let accessToken, expiredAt, refreshToken, authority: String

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case expiredAt = "expired_at"
        case refreshToken = "refresh_token"
        case authority
    }
}
/*
 {
    "access_token" : "eyksdmsedfa.sdfaecaef.qewdadeqawdrw",
    "expired_at" : "2022-07-18T12:12:12",
    "refresh_token" : "dvghfdfesdf.gyjgjrmgjyjg.ogjiyjghjgg",
    "authority": "BASKETBALL_MANAGER"
 }
 */
