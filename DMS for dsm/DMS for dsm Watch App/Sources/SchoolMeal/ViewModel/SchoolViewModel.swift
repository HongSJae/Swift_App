import Moya
import Foundation

class SchoolViewModel: ObservableObject {
    let schoolMealClient = MoyaProvider<SchoolMealService>(plugins: [MoyaLoggerPlugin()])
    @Published var nowDate = Date() // 현재의 Date (ex: 2020-08-13 09:14:48 +0000)
    @Published var menu: MenuStruct = MenuStruct(date: "", breakfast: [], lunch: [], dinner: [])
    @Published var year: String = ""
    @Published var month: String = ""
    @Published var date: String = ""
    @Published var allergy: Bool = false
    @Published var progress: Bool = true
    func getMenu() {
        schoolMealClient.request(.dsm(year: year, month: month, date: date, allergy: allergy)) { res in
            switch res {
            case .success(let result):
                switch result.statusCode {
                case 200...201:
                    DispatchQueue.main.async {
                        let decoder = JSONDecoder()
                        if let data = try? decoder.decode(SchoolMealModel.self, from: result.data) {
                            self.menu = MenuStruct(date: data.menu[0].date,
                                             breakfast: data.menu[0].breakfast,
                                             lunch: data.menu[0].lunch,
                                             dinner: data.menu[0].dinner)
                            print("menu success")
                            print("res: \(self.menu)")
                        } else {
                            print("⚠️menu docoder error")
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
    private func dateformatter(_ time: Time) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = {
            switch time {
            case .year: return "y"
            case .month: return "M"
            case .date: return "d"
            }
        }() // 2020-08-13 16:30
        let str = dateFormatter.string(from: nowDate) // 현재 시간의 Date를 format에 맞춰 string으로 반환
        return str
    }
    func updateDate() {
        year = dateformatter(.year)
        month = dateformatter(.month)
        date = dateformatter(.date)
        allergy = false
        getMenu()
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
