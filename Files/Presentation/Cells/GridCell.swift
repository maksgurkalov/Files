//
//  GridCell.swift
//  Files
//
//  Created by maks on 19.06.2022.
//

import UIKit

class GridCell: BaseCell {
    
    static let identifier = "GridCell"
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray.cgColor
        
        label.numberOfLines = 2
        label.clipsToBounds = true
        label.textAlignment = .center
        addSubview(label)
        
        imageView.leadingToSuperview(offset: 4)
        imageView.trailingToSuperview(offset: 4)
        imageView.topToSuperview(offset: 4)
        imageView.bottomToTop(of: label, offset: -2)
        
        label.height(frame.size.height / 3)
        label.bottomToSuperview(offset: -4)
        label.trailingToSuperview(offset: 2)
        label.leadingToSuperview(offset:2)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
