//
//  TableViewCell.swift
//  CMD
//
//  Created by 홍승재 on 2022/07/13.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    lazy var Schedule = { () -> UITableViewCell in
        let tableviewCell = UITableViewCell()
        return tableviewCell
    }()
}
