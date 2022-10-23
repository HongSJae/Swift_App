import Foundation
import Alamofire

class ExchangeRateViewModel: ObservableObject {
    @Published var sendingCountry: String = ""
    @Published var gettingCountry: String = ""
    @Published var exchangeRate: String = "0.00"
    @Published var tag: Int? = nil
    @Published var amount: String = "1"
    @Published var showingAlert: Bool = false
    
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
            "apikey": "XK1OvFJhfowVZk2xpPNhx1ps4EslYXgm"
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
                            self.exchangeRate =
                            String((Double(self.exchangeRate) ?? 0) *
                                   (Double(self.amount) ?? 0))
                            print("송금 금액:", self.exchangeRate)
                            if Double(self.exchangeRate) ?? 0 < 0
                                || Double(self.exchangeRate) ?? 0 > 10000
                                || Double(self.exchangeRate) == nil
                                || self.amount == ""
                            {
                                self.showingAlert = true
                            } else {
                                self.tag = 1
                            }
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

