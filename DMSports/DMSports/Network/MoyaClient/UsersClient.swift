import Foundation
import Moya

enum UsersService {
    // _
    case signUp(email: String, password: String, name: String)
    case deleteAccount(password: String)
    // logout
    case logout
    // password
    case changePassword(oldPW: String, newPW: String)
    case changePasswordAfterVerify(email: String, newPW: String)
    // auth
    case login(email: String, password: String)
    case reToken
    
    // mail
    case mailDuplicate(email: String)
    case mailSignUp(email: String)
    case mailVerify(email: String, authCode: String)
    case mailFind(email: String)
    // my
    case my
}

extension UsersService: TargetType {
    var baseURL: URL {
        return URL(string: "http://3.35.154.118:8080/users")!
    }
    
    var path: String {
        switch self {
        case .signUp:
            return ""
        case .deleteAccount:
            return ""
        case .logout:
            return "/logout"
        case .changePassword:
            return "/password"
        case .changePasswordAfterVerify:
            return "/password"
        case .login:
            return "/auth"
        case .reToken:
            return "/auth"
        case .mailDuplicate:
            return "/mail/duplicate"
        case .mailSignUp:
            return "/mail/signup"
        case .mailVerify:
            return "/mail/verify"
        case .mailFind:
            return "/mail/find"
        case .my:
            return "/my"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .mailDuplicate, .mailSignUp, .mailVerify, .signUp, .login, .mailFind:
            return .post
        case .my:
            return .get
        case .changePassword:
            return .patch
        case .reToken, .changePasswordAfterVerify:
            return .put
        case .logout, .deleteAccount:
            return .delete
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .signUp(let email, let password, let name):
            return .requestParameters(
                parameters:
                    [
                        "password": password,
                        "name": name,
                        "email": email
                    ],
                encoding: JSONEncoding.default)
        case .deleteAccount(let password):
            return .requestParameters(
                parameters: [
                    "password": password
                ],
                encoding: JSONEncoding.default)
        case .logout:
            return .requestPlain
        case .changePassword(let oldPW, let newPW):
            return .requestParameters(
                parameters: [
                    "old_password": oldPW,
                    "new_password": newPW
                ],
                encoding: JSONEncoding.default)
        case .changePasswordAfterVerify(let email, let newPW):
            return .requestParameters(
                parameters: [
                    "email": email,
                    "new_password": newPW
                ],
                encoding: JSONEncoding.default)
        case .login(let email, let password):
            return .requestParameters(
                parameters: [
                    "email": email,
                    "password": password
                ],
                encoding: JSONEncoding.default)
        case .reToken:
            return .requestPlain
        case .mailDuplicate(let email):
            return .requestParameters(
                parameters: [
                    "email": email
                ],
                encoding: JSONEncoding.default)
        case .mailSignUp(let email):
            return .requestParameters(
                parameters: [
                    "email": email,
                ],
                encoding: JSONEncoding.default)
        case .mailVerify(let email, let authCode):
            return .requestParameters(
                parameters: [
                    "email": email,
                    "auth_code": authCode
                ],
                encoding: JSONEncoding.default)
        case .mailFind(let email):
            return .requestParameters(
                parameters: [
                    "email": email,
                ],
                encoding: JSONEncoding.default)
        case .my:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
            // 토큰 필요없음
        case .signUp, .changePasswordAfterVerify, .login, .mailDuplicate, .mailVerify, .mailSignUp, .mailFind:
            return Header.tokenIsEmpty.header()
            // 리프레시 토큰
        case .reToken:
            return Header.refreshToken.header()
            // 엑세스 토큰
        case .logout, .deleteAccount, .changePassword, .my:
            return Header.accessToken.header()
        }
    }
}
