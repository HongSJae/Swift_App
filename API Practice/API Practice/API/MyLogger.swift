//
//  MyLogger.swift
//  API Practice
//
//  Created by 홍승재 on 2022/06/22.
//

import Foundation
import Alamofire

final class MyLogger: EventMonitor {
    
    let queue = DispatchQueue(label: "MyLogger")
    
    func requestDidResume(_ request: Request) {
        print("MyLogger - requestDidResume()")
        debugPrint(request)
    }
    
    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        print("Mylogger - request.didParseResponse()")
        debugPrint(response)
    }
}
