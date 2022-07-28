//
//  Response.swift
//  CMD
//
//  Created by 홍승재 on 2022/07/07.
//

import Foundation

struct TimeGet: Codable { //시간표 받기
    
    let period1st: String
    let period2nd: String
    let period3th: String
    let period4th: String
    let period5th: String
    let period6th: String
    let period7th: String
    let period8th: String
    let period9th: String
    let period10th: String
}

struct SignInInfo: Codable {
    let accessToken: String
}

struct SignUpInfo: Codable {
    let userId: String
    let password: String
}

struct Classinfo: Codable {
    let username, number, birthday, field: String?
}

struct NoticeboardElement: Codable {
    let id: Int
    let title, contents: String
}

typealias Noticeboard = [NoticeboardElement]


