import Moya
import Foundation

class NoticeViewModel: ObservableObject {
    let noticesService = MoyaProvider<NoticesService>(plugins: [MoyaLoggerPlugin()])
    @Published var recentNoticeModelStruct: RecentNoticeModelStruct = RecentNoticeModelStruct(manager: [], admin: [])
    func fetchRecentNotice() {
        noticesService.request(.recentNotice) { res in
            switch res {
            case .success(let result):
                switch result.statusCode {
                case 200:
                    DispatchQueue.main.async {
                        let decoder = JSONDecoder()
                        if let data = try? decoder.decode(RecentNoticeModel.self, from: result.data) {
                            self.recentNoticeModelStruct = RecentNoticeModelStruct(
                                manager: data.manager.map({ index in
                                    AdminStruct(id: index.id,
                                                title: index.title,
                                                contentPreview: index.contentPreview,
                                                createdAt: index.createdAt,
                                                type: index.type)
                                }),
                                admin: data.admin.map({ index in
                                    AdminStruct(id: index.id,
                                                title: index.title,
                                                contentPreview: index.contentPreview,
                                                createdAt: index.createdAt,
                                                type: index.type)
                                })
                            )
                            print(self.recentNoticeModelStruct)
                            print("fetchRecentNotice success!")
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
