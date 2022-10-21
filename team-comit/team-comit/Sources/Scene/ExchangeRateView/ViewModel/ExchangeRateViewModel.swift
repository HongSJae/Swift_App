import Foundation
import Alamofire

class ExchangeRateViewModel: ObservableObject {
    @Published var sendingCountry: String = ""
    @Published var gettingCountry: String = ""
    @Published var exchangeRate: String = "0.00"
    @Published var amount: String = "1"
    
    func calculate() {
        print("calculating...")
        print("gettingCountry :", gettingCountry)
        print("sendingCountry :", sendingCountry)
        let url = "https://api.apilayer.com/currency_data/live"
        let param = [
            "source": sendingCountry,
            "currencies": gettingCountry
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
                    DispatchQueue.main.async {
                        do {
                            let model = try JSONDecoder().decode(ExchangeRateModel.self, from: result.data!)
                            self.exchangeRate = String(model.quotes[self.sendingCountry + self.gettingCountry]!)
                            print("exchangeRate:", self.exchangeRate)
                            print("amount:", self.amount)
                            self.exchangeRate = String((Double(self.exchangeRate) ?? 0) * (Double(self.amount) ?? 0))
                            print("송금 금액:", self.exchangeRate)
                        } catch {
                            print("NON.DATA")
                        }
                    }
                default:
                    print("user or server's wrong ⚠️")
                }
            case .failure(_):
                print("Failure..🚫")
            }
        }
    }
}

