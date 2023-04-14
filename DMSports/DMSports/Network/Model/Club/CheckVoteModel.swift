import Foundation

// MARK: - CheckVoteModel
struct CheckVoteModel: Codable {
    let isBan: Bool
    let banPeriod: String?
    let maxPeople: Int
    let voteList: [VoteList]

    enum CodingKeys: String, CodingKey {
        case isBan = "ban"
        case banPeriod = "ban_period"
        case maxPeople = "max_people"
        case voteList = "vote_list"
    }
}

// MARK: - VoteList
struct VoteList: Codable {
    let voteID: Int
    let time: Vote.RawValue
    let voteCount, maxPeople: Int
    let isComplete: Bool
    let voteUser: [VoteUser]

    enum CodingKeys: String, CodingKey {
        case voteID = "vote_id"
        case time
        case voteCount = "vote_count"
        case maxPeople = "max_people"
        case isComplete = "is_complete"
        case voteUser = "vote_user"
    }
}

// MARK: - VoteUser
struct VoteUser: Codable {
    let name: String
    let team: Int?
}
// MARK: - CheckVoteModal
struct CheckVoteModelStruct: Hashable {
    let isBan: Bool
    let banPeriod: String?
    let maxPeople: Int
    let voteList: [VoteListStruct]
}

// MARK: - VoteList
struct VoteListStruct: Hashable {
    let voteID: Int
    let time: Vote
    let voteCount, maxPeople: Int
    let isComplete: Bool
    let voteUser: [VoteUserStruct]
}

// MARK: - VoteUser
struct VoteUserStruct: Hashable {
    let name: String
    let team: Int?
}
