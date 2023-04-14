//
//  ViewController.swift
//  ToDoListAgain
//
//  Created by 홍승재 on 2022/07/05.
//

import UIKit

var TDL = [ToDoList]()

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var EditBtton: UIButton!
    
    override func viewDidLoad() {
           super.viewDidLoad()
        TableView.dataSource = self //TableView 쓸 때 꼭 필요함
        TableView.delegate = self // ==
        //loadData()
       }
    
    override func viewDidAppear(_ animated: Bool) {
        TableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        setData()
    }
    
    private func setData() {
        let data = TDL.map {
            [
                "title": $0.ToDoTilte,
                "content": $0.ToDoText
            ]
        }
        UserDefaults.standard.set(data, forKey: "item")
        UserDefaults.standard.synchronize()
    }
    func loadData() {
        guard let data = UserDefaults.standard.object(forKey: "item") as? [[String: AnyObject]] else {
            return
        }
        
        TDL = data.map {
            let title = $0["title"] as? String
            let content = $0["content"] as? String
            
            return ToDoList(ToDoTitle: title!, ToDoText: content!)
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TDL.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = TDL[indexPath.row].ToDoTilte
        cell.detailTextLabel?.text = TDL[indexPath.row].ToDoText
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            TDL.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
//    @IBAction func EditBtn(_ sender: UIBarButtonItem) {
//        if TableView.isEditing {
//            sender.title = "Edit"
//            TableView.setEditing(false, animated: true)
//        } else {
//            sender.title = "Done"
//            TableView.setEditing(true, animated: true)
//        }
//    }
    @IBAction func LeftButton(_ sender: UIButton) {
        if TableView.isEditing {
            EditBtton.setTitle("수정", for: .normal)
            TableView.setEditing(false, animated: true)
        } else {
            EditBtton.setTitle("완료", for: .normal)
            TableView.setEditing(true, animated: true)
        }
    }
    
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let moved = TDL[sourceIndexPath.row]
        TDL.remove(at: sourceIndexPath.row)
        TDL.insert(moved, at: destinationIndexPath.row)
    }


}

