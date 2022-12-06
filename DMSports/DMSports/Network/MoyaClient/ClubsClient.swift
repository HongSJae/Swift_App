import Foundation
import Moya

enum ClubsService {
    // vote
    case vote(userID: Int)
    case checkVote(type: Club)
    case voteList(type: Club)
    // schedule
    case scheduleHope
}

extension ClubsService: TargetType {
    var baseURL: URL {
        return URL(string: "http://3.35.154.118:8080/clubs")!
    }

    var path: String {
        switch self {
        case .vote(let userID):
            return "/vote/\(userID)"
        case .checkVote:
            return "/vote"
        case .voteList:
            return "/vote/history"
        case .scheduleHope:
            return "/schedule/hope"
        }
    }

    var method: Moya.Method {
        switch self {
        case .vote, .scheduleHope:
            return .post
        case .voteList, .checkVote:
            return .get
        }
    }

    var task: Moya.Task {
        switch self {
        case .vote:
            return .requestPlain
        case .checkVote(let type):
            return .requestParameters(
                parameters: [
                    "type": type
                ],
                encoding: URLEncoding.queryString)
        case .voteList(let type):
            return .requestParameters(
                parameters: [
                    "type": type
                ],
                encoding: URLEncoding.queryString)
        case .scheduleHope:
            return .requestPlain
        }
    }

    var headers: [String : String]? {
        switch self {
        case .scheduleHope, .voteList, .vote, .checkVote:
            return Header.accessToken.header()
        }
    }
}
