//
//  MySearchRouter.swift
//  API Practice
//
//  Created by 홍승재 on 2022/06/22.
//

import Foundation
import Alamofire


//검색관련 api
enum MySearchLouter: URLRequestConvertible {
    
    case searchPhotos(term: String)
    case searchUsers(term: String)
    
    
    var baseURL: URL {
        return URL(string: API.BASE_URL + "search/")!
    }
    
    var method: HTTPMethod {
//        return .get
        
        switch self {
        case .searchPhotos, .searchUsers:
            return .get
        }
        
//        switch self {
//        case .searchPhotos:
//            return .get
//        case .searchUsers:
//            return .post
//        }
    }
    
    var endPoint: String {
        switch self {
        case .searchPhotos:
            return "photos/"
        case .searchUsers:
            return "users/"
        }
    }
    
    var parameters : [String: String] {
        switch self {
        case let .searchUsers(term), let .searchPhotos(term):
            return ["query": term]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let url = baseURL.appendingPathComponent(endPoint)
        
        print("MySearchLouter - asRequest url : \(url)")
        
        var request = URLRequest(url: url)
        
        request.method = method
        
        request = try URLEncodedFormParameterEncoder().encode(parameters, into: request)
        
        return request
    }
}
