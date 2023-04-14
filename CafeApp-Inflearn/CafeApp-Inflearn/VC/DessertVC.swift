//
//  DessertVC.swift
//  CafeApp-Inflearn
//
//  Created by 홍승재 on 2022/07/08.
//

import UIKit

class DessertVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.TableView.delegate = self
        self.TableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Denames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = TableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        
        cell.ProductName.text = Denames[indexPath.row]
        cell.ProductPrice.text = Deprices[indexPath.row] as String
        cell.ImageViewinCell.sd_setImage(with: URL(string: Deimages[indexPath.row]))
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    

    //셀 선택시 팝업
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.view.hideAllToasts() //이전 토스트창 지우기
        self.view.makeToast(Demessages[indexPath.row], duration: 2.0, position: .bottom)
        
        let cell = tableView.cellForRow(at: indexPath) as! MyTableViewCell
        cell.contentView.backgroundColor = UIColor.lightGray //클릭시 생상 변경
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            cell.contentView.backgroundColor = UIColor.white
        })
    }
}
