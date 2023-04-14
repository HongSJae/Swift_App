import Moya
import Foundation

class MainViewModel: ObservableObject {
    let clubClient = MoyaProvider<ClubsService>(plugins: [MoyaLoggerPlugin()])
    @Published var checkVoteModel = CheckVoteModelStruct(isBan: false, banPeriod: nil, maxPeople: 0, voteList: [])
    @Published var type: Club = .BADMINTON
    func getCheckVote() {
        clubClient.request(.checkVote(type: type)) { res in
            switch res {
            case .success(let result):
                switch result.statusCode {
                case 200...201:
                    DispatchQueue.main.async {
                        let decoder = JSONDecoder()
                        if let data = try? decoder.decode(CheckVoteModel.self, from: result.data) {
                            self.checkVoteModel = CheckVoteModelStruct(
                                isBan: data.isBan,
                                banPeriod: data.banPeriod ?? "nil",
                                maxPeople: data.maxPeople,
                                voteList: data.voteList.map({ voteListData in
                                    VoteListStruct(
                                        voteID: voteListData.voteID,
                                        time: Vote(rawValue: voteListData.time.self) ?? .DINNER,
                                        voteCount: voteListData.voteCount,
                                        maxPeople: voteListData.maxPeople,
                                        isComplete: voteListData.isComplete,
                                        voteUser: voteListData.voteUser.map({ voteUserData in
                                            VoteUserStruct(
                                                name: voteUserData.name,
                                                team: voteUserData.team
                                            )
                                        })
                                    )
                                })
                            )
                            print("checkVote success")
                        } else {
                            print("⚠️vote docoder error")
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
    func vote(userID: Int) {
        clubClient.request(.vote(userID: userID)) { res in
            switch res {
            case .success(let result):
                switch result.statusCode {
                case 204:
                    print("투표 성공")
                    self.getCheckVote()
                default:
                    DispatchQueue.main.async {
                        print("알 수 없는 오류입니다. 문의 바랍니다!\n(code: \(result.statusCode)")
                    }
                }
            case .failure(let err):
                print("⛔️login error: \(err.localizedDescription)")
            }
        }
    }
//    func getMyProFile() {
//        userClient.request(.getMyprofile) { res in
//            switch res {
//            case .success(let result):
//                switch result.statusCode {
//                case 200:
//                    if let data = try? JSONDecoder().decode(ProfileModel.self, from: result.data) {
//                        Account.setAccount(
//                            id: data.name,
//                            email: data.email,
//                            profileImagLink: data.profileImageUrl,
//                            positions: data.positions
//                        )
//                    } else {
//                        print("⚠️myProfile LG docoder error")
//                    }
//                default:
//                    print(result.statusCode)
//                }
//            case .failure(let err):
//                print("⛔️myProfile LG Error: \(err.localizedDescription)")
//            }
//        }
//    }
}
