//
//  MyAlamofireManager.swift
//  API Practice
//
//  Created by 홍승재 on 2022/06/22.
//

import Foundation
import Alamofire

final class MyAlamofireManager {
    
    //싱글턴 적용
    static let shared = MyAlamofireManager()
    
    //인터셉터
    let interceptors = Interceptor(interceptors:
                                [
                                    BaseInterceptor()
                                ])
    
    //로거
    let monitors = [MyLogger(), MyApiStatusLogger()] as [EventMonitor]
    
    //세선 설정
    let session: Session
    
    private init() {
        session = Session(
            interceptor: interceptors,
            eventMonitors: monitors
        )
        
    }
}
