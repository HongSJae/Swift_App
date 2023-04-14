import Foundation

//RANDOMFACT
struct RandomFactResponse: Codable {
    let results: [RandomFactResponseResult]
}

struct RandomFactResponseResult: Codable {
    let id: Int
    let text: String
}

//GuessSEX
struct GuessSex: Codable {
    let name: String
    let gender: String
    let probability: Double
}
