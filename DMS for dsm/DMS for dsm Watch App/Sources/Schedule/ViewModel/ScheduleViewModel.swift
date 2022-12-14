import Moya
import SwiftUI
import Foundation

class ScheduleViewModel: ObservableObject {
    let scheduleClient = MoyaProvider<ScheduleServices>(plugins: [MoyaLoggerPlugin()])
    @Published var nowDate = Date() // 현재의 Date (ex: 2020-08-13 09:14:48 +0000)
    @Published var grade: String = ""
    @Published var _class: String = ""
    @Published var date: String = ""
    @Published var schedule: [String] = ["시간표가 없어요..", "시간표가 없어요..", "시간표가 없어요..", "시간표가 없어요.."]
    @Published var perio: [String] = ["1", "2", "3", "4"]
    @Published var progress: Bool = true
    
    func getSchedule() {
        scheduleClient.request(.dsm(grade: grade, class: _class, date: date)) { res in
            switch res {
            case .success(let result):
                switch result.statusCode {
                case 200...201:
                    DispatchQueue.main.async {
                        let decoder = JSONDecoder()
                        if let data = try? decoder.decode(ScheduleModel.self, from: result.data) {
                            self.schedule = data.hisTimetable[1].row?.map({ row in
                                row.itrtCntnt
                            }) ?? ["시간표가 없어요..", "시간표가 없어요..", "시간표가 없어요..", "시간표가 없어요.."]
                            self.perio = data.hisTimetable[1].row?.map({ row in
                                row.perio
                            }) ?? ["1", "2", "3", "4"]
                        } else {
                            print("⚠️Schedule docoder error")
                        }
                        self.progress = false
                    }
                default:
                    DispatchQueue.main.async {
                        print("알 수 없는 오류입니다. 문의 바랍니다!\n(code: \(result.statusCode)")
                        self.progress = false
                    }
                }
            case .failure(let err):
                print("⛔️getCheckVote error: \(err.localizedDescription)")
                self.progress = false
            }
        }
    }
    
    func updateDate() {
        date = toDayDate()
        getSchedule()
    }
    func toDayDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yMMdd"
        let str = dateFormatter.string(from: nowDate) // 현재 시간의 Date를 format에 맞춰 string으로 반환
        return str
    }
    func titleDayDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "y년 M월 d일 EEEE"
        dateFormatter.locale = Locale(identifier:"ko_KR") // PM, AM을 언어에 맞게 setting (ex: PM -> 오후)
        let str = dateFormatter.string(from: nowDate) // 현재 시간의 Date를 format에 맞춰 string으로 반환
        return str
    }
    func nextDate() {
        let calendar = Calendar.current
        let hundred = calendar.date(byAdding: .day, value: 1, to: nowDate)
        nowDate = hundred! // 현재 시간의 Date를 format에 맞춰 string으로 반환
        updateDate()
    }
    func backDate() {
        let calendar = Calendar.current
        let hundred = calendar.date(byAdding: .day, value: -1, to: nowDate)
        nowDate = hundred! // 현재 시간의 Date를 format에 맞춰 string으로 반환
        updateDate()
    }
}
