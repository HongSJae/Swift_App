//
//  TableviewCellTableViewCell.swift
//  CMD
//
//  Created by 홍승재 on 2022/07/28.
//

import UIKit
import Then
import SnapKit

class TableViewCell: UITableViewCell {
    
    static let cellId = "CellId"
    
    var Content = UIView().then {
        $0.layer.cornerRadius = 20
        $0.backgroundColor = .white
    }
    var Header = UILabel().then {
        $0.textAlignment = .center
        $0.text = "Hello World"
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 20)
    }
    var Title = UILabel().then {
        $0.textAlignment = .center
        $0.text = "Hello Swift"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 20)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(named: "BackgroundColor")
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        self.addSubview(Content)
        Content.addSubview(Header)
        Content.addSubview(Title)
        
        Content.snp.makeConstraints {
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.top.equalToSuperview().offset(20)
            $0.bottom.equalToSuperview().offset(-20)
            $0.height.equalTo(250)
        }
        Header.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(Content.snp.top).offset(10)
        }
        Title.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(Header.snp.top).offset(30)
        }
    }
}
