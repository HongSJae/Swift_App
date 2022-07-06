//
//  ToDoList.swift
//  ToDoListAgain
//
//  Created by 홍승재 on 2022/07/05.
//

import Foundation

struct ToDoList {
    var ToDoTilte: String = " "
    var ToDoText: String = " "
    init(ToDoTitle: String, ToDoText: String) {
        self.ToDoTilte = ToDoTitle
        self.ToDoText = ToDoText
    }
}
