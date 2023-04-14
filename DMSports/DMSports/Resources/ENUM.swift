//
//  ENUM.swift
//  DMSports
//
//  Created by 홍승재 on 2022/12/01.
//

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

enum Vote: String, Codable {
    case LUNCH = "점심시간"
    case DINNER = "저녁시간"
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
