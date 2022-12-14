import Foundation
import Moya

enum SchoolMealService {
    case dsm(year: String, month: String, date: String, allergy: Bool)
}

extension SchoolMealService: TargetType {
    var baseURL: URL {
        return URL(string: "https://schoolmenukr.ml/api/high")!
    }
    var path: String {
        switch self {
        case .dsm:
            return "/G100000170"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .dsm:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .dsm(let year, let month, let date, let allergy):
            switch allergy {
            case true:
                return .requestParameters(
                    parameters: [
                        "year": year,
                        "month": month,
                        "date": date,
                    ],
                    encoding: URLEncoding.queryString)
                
            case false:
                return .requestParameters(
                    parameters: [
                        "year": year,
                        "month": month,
                        "date": date,
                        "allergy": "hidden"
                    ],
                    encoding: URLEncoding.queryString)
            }
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .dsm:
            return Header.tokenIsEmpty.header()
        }
    }
}
