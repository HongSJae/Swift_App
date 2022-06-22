//
//  MyApiStatusLogger.swift
//  API Practice
//
//  Created by 홍승재 on 2022/06/22.
//

import Foundation
import Alamofire

final class MyApiStatusLogger: EventMonitor {
    
    let queue = DispatchQueue(label: "MyApiStatusLogger")
    
//    func requestDidResume(_ request: Request) {
//        print("MyApiStatusLogger - requestDidResume()")
//        debugPrint(request)
//    }
    
    func request(_ request: DataRequest, didParseResponse response: DataResponse<Data?, AFError>) {
        
        guard let statusCode = request.response?.statusCode else { return }
        
        print("MyApiStatusLogger - statusCode(): \(statusCode)")
        //debugPrint(response)
    }
}
