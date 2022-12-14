import Foundation

// MARK: - SchoolMealModel
struct ScheduleModel: Codable {
    let hisTimetable: [HisTimetable]
}

// MARK: - HisTimetable
struct HisTimetable: Codable {
    let row: [Row]?
}
// MARK: - Row
struct Row: Codable {
    let itrtCntnt: String
    let perio: String

    enum CodingKeys: String, CodingKey {
        case itrtCntnt = "ITRT_CNTNT"
        case perio = "PERIO"
    }
}
