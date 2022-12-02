//
//  ENUM.swift
//  DMSports
//
//  Created by 홍승재 on 2022/12/01.
//
enum Sports {
    case 배드민턴
    case 축구
    case 농구
    case 배구
    var name: String {
        switch self {
        case .배드민턴:
            return "배드민턴"
        case .축구:
            return "축구"
        case .농구:
            return "농구"
        case .배구:
            return "배구"
        }
    }
}

import Foundation

enum Authority: String {
    case USER
    case BASKETBALL_MANAGER
    case SOCCER_MANAGER
    case VOLLEYBALL_MANAGER
    case BADMINTON_MANAGER
    case ADMIN
}

enum Club: String {
    case BASKETBALL
    case SOCCER
    case BADMINTON
    case VOLLEYBALL
}

enum Notice: String {
    case ALL
    case BASKETBALL
    case SOCCER
    case BADMINTON
    case VOLLEYBALL
}

enum Vote: String {
    case LUNCH
    case DINNER
}

enum DayOfWeek: String {
    case MONDAY
    case TUESDAY
    case WEDNESDAY
    case THURSDAY
    case FRIDAY
    case SATURDAY
    case SUNDAY
}

enum Place: String {
    case GYM
    case SCHOOLYARD
}
