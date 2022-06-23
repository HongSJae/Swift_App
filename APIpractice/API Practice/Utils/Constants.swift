//
//  Constants.swift
//  API Practice
//
//  Created by 홍승재 on 2022/06/20.
//

import Foundation

enum SEGUE_ID {
    static let USER_LIST_VC = "GoToUserListVC"
    static let PHOTO_COLLECTION_VC = "GoToPhotoCollectionVC"
}

enum API {
    
    static let BASE_URL: String = "https://api.unsplash.com/"
    
    static let CLIENT_ID: String = "bsHmLmr6gp_JObbgbIWlVzc3J34O6YZVUZ3B3BvrygU"
}

enum NOTIFICATION {
    enum API {
        static let AUTH_FAIL = "authentication_fail"
    }
}
