import Foundation

struct ToDoList {
    var ToDoTilte: String = " "
    var ToDoText: String = " "
    init(ToDoTitle: String, ToDoText: String) {
        self.ToDoTilte = ToDoTitle
        self.ToDoText = ToDoText
    }
}
