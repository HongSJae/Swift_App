import UIKit
import SocketIO

class SocketIOManager: NSObject {
    static let shared = SocketIOManager()
    var manager = SocketManager(socketURL: URL(string: "http://52.55.240.35:8080")!, config: [.log(true), .compress])
    var socket: SocketIOClient!
    override init() {
        super.init()
        socket = self.manager.socket(forNamespace: "/")
        
        socket.on("test") { dataArray, ack in
            print(dataArray)
        }
    }

    func establishConnection() {
        socket.connect()
    }
    
    func closeConnection() {
        socket.disconnect()
    }
   
    func sendMessage(message: String, nickname: String) {
        socket.emit("event",  ["message" : "This is a test message"])
        socket.emit("event1", [["name" : "ns"], ["email" : "@naver.com"]])
        socket.emit("event2", ["name" : "ns", "email" : "@naver.com"])
        socket.emit("msg", ["nick": nickname, "msg" : message])
        
    }
}

