//
//  Response.swift
//  CMD
//
//  Created by 홍승재 on 2022/07/07.
//

import Foundation

//MARK: - 시간표 (1 ~ 10 교시)

struct TimeGet: Codable {
    
    let period1st: String?
    let period2nd: String?
    let period3th: String?
    let period4th: String?
    let period5th: String?
    let period6th: String?
    let period7th: String?
    let period8th: String?
    let period9th: String?
    let period10th: String?
}

//MARK: - 로그인정보 (토큰)

struct SignInInfo: Codable {
    let accessToken: String
}

//MARK: - 회원가입 (아이디 비밀번호)

struct SignUpInfo: Codable {
    let userId: String
    let password: String
}

//MARK: - 학생정보 (이름, 번호, 생일, 전공)

struct Classinfo: Codable {
    let username, number, birthday, field: String?
    let seatNumber: CLong?
}
//MARK: - 내 정보

struct Myinfo: Codable {
    let username, number, birthday, field, userId: String?
    let seatNumber: CLong?
}
//MARK: - 공지사항

struct NoticeboardElement: Codable {
    let id: Int
    let title, contents: String
}

typealias Noticeboard = [NoticeboardElement]
