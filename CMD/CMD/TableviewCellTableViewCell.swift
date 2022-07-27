//
//  TableviewCellTableViewCell.swift
//  CMD
//
//  Created by 홍승재 on 2022/07/28.
//

import UIKit

class TableviewCellTableViewCell: UITableViewCell {
    
    let cellId = "CellId"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        
    }
}
