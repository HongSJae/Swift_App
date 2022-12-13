import Moya
import Foundation

class MainViewModel: ObservableObject {
    let schoolMealClient = MoyaProvider<SchoolMealService>(plugins: [MoyaLoggerPlugin()])
    @Published var menu: MenuStruct = MenuStruct(date: "", breakfast: [], lunch: [], dinner: [])
    @Published var year: String = ""
    @Published var month: String = ""
    @Published var date: String = ""
    @Published var allergy: Bool = false
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
                    }
                default:
                    DispatchQueue.main.async {
                        print("알 수 없는 오류입니다. 문의 바랍니다!\n(code: \(result.statusCode)")
                    }
                }
            case .failure(let err):
                print("⛔️getCheckVote error: \(err.localizedDescription)")
            }
        }
    }
}
