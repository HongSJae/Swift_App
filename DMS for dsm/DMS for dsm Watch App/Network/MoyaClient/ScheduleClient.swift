import Foundation
import Moya

enum ScheduleServices {
    case dsm(grade: String, class: String, date: String)
}

extension ScheduleServices: TargetType {
    var baseURL: URL {
        return URL(string: "https://open.neis.go.kr/hub")!
    }
    var path: String {
        switch self {
        case .dsm:
            return "/hisTimetable"
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
        case .dsm(let grade, let _class, let date):
            return .requestParameters(
                parameters: [
                    "Key": "ef00fcf0e66242989c9e7b24f2fc4fe1",
                    "Type": "json",
                    "pIndex": "1",
                    "pSize": "100",
                    "ATPT_OFCDC_SC_CODE": "G10",
                    "SD_SCHUL_CODE": "7430310",
                    "GRADE": grade,
                    "CLASS_NM": _class,
                    "ALL_TI_YMD": date
                ],
                encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .dsm:
            return Header.tokenIsEmpty.header()
        }
    }
}
