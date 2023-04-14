import Foundation
import Moya

enum NoticesService {
    // _
    case noticesList
    // admin
    case postAdmin(title: String, content: String, type: Notice)
    case postClub(title: String, content: String)
    // post_id
    case getNotice(postID: Int)
    case patchNotice(title: String, content: String, postID: Int)
    case deleteNotice(postID: Int)
    //recent
    case recentNotice
}

extension NoticesService: TargetType {
    var baseURL: URL {
        return URL(string: "http://3.35.154.118:8080/notices")!
    }
    
    var path: String {
        switch self {
        case .noticesList:
            return ""
        case .postAdmin(_, _, let type):
            return "/admin?type=\(type)"
        case .postClub:
            return "/club"
        case .getNotice(let postID), .patchNotice(_, _, let postID), .deleteNotice(let postID):
            return "/\(postID)"
        case .recentNotice:
            return "/recent"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .noticesList:
            return .get
        case .postAdmin:
            return .post
        case .postClub:
            return .post
        case .getNotice:
            return .get
        case .patchNotice:
            return .patch
        case .deleteNotice:
            return .delete
        case .recentNotice:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .noticesList:
            return .requestPlain
        case .postAdmin(let title, let content, _):
            return .requestParameters(
                parameters:
                    [
                        "title": title,
                        "content": content
                    ],
                encoding: JSONEncoding.default)
        case .postClub(let title, let content):
            return .requestParameters(
                parameters:
                    [
                        "title": title,
                        "content": content
                    ],
                encoding: JSONEncoding.default)
        case .getNotice:
            return .requestPlain
        case .patchNotice(let title, let content, _):
            return .requestParameters(
                parameters:
                    [
                        "title": title,
                        "content": content
                    ],
                encoding: JSONEncoding.default)
        case .deleteNotice:
            return .requestPlain
        case .recentNotice:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .noticesList, .postAdmin, .deleteNotice, .getNotice, .postClub, .recentNotice, .patchNotice:
            return Header.accessToken.header()
        }
    }
}
