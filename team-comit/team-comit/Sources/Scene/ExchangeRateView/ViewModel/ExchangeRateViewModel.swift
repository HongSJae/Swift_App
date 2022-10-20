import Foundation
import Alamofire

class ExchangeRateViewModel: ObservableObject {
    @Published var sendingCountry: String = ""
    @Published var getingCountry: String = ""
    @Published var exchangeRate: String = ""
    
    func calculate() {
        let url = "https://api.apilayer.com/currency_data/live"
        let param = [
            "source": sendingCountry,
            "currencies": getingCountry
        ]
        let header: HTTPHeaders = [
            "apikey": "o4SXQyHc27lBbT4Ho71xOj63hlYxjfKT"
        ]
        AF.request(url,
                   method: .get,
                   parameters: param,
                   encoding: URLEncoding.default,
                   headers: header
        )
        .validate(statusCode: 200..<300)
        .responseData { result in
            switch result.result {
            case .success(_):
                switch result.response!.statusCode {
                case 200 ..< 300:
                    do {
                        let model = try JSONDecoder().decode(ExchangeRateModel.self, from: result.data!)
                        self.exchangeRate = String(model.quotes.exchangedRate)
                    } catch {
                        print("NON.DATA")
                    }
                default:
                    print("user's wrong ⚠️")
                }
            case .failure(_):
                print("Failure..🚫")
            }
        }
    }
    
}

