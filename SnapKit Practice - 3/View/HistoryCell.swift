//
//  HistoryCell.swift
//  SnapKit Practice - 3
//
//  Created by Farukh Iskalinov on 1.07.20.
//  Copyright © 2020 Farukh Iskalinov. All rights reserved.
//

import UIKit
import SnapKit
class HistoryCell: UITableViewCell {

    private let historyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layoutUI(){
        addSubview(historyLabel)
        historyLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(10)
        }
    }
    
    func configure(historyText: String){
        historyLabel.text = historyText
    }
    
    
    
}
