//
//  ListCell.swift
//  Files
//
//  Created by maks on 19.06.2022.
//

import UIKit
import TinyConstraints

class ListCell: BaseCell {
    
    fileprivate var chevronImage: UIImageView!
    
    static let identifier = "ListCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label.numberOfLines = 1
        
        let separatorView = UIView()
        separatorView.backgroundColor = .lightGray
        addSubview(separatorView)
        
        chevronImage = UIImageView()
        addSubview(chevronImage)
        
        label.leadingToTrailing(of: imageView, offset: 4)
        label.centerYToSuperview()
        label.trailingToLeading(of: chevronImage, offset: -4)
        
        imageView.leadingToSuperview(offset: 4)
        imageView.centerYToSuperview()
        imageView.height(38)
        imageView.width(40)
        
        chevronImage.trailingToSuperview(offset: 8)
        chevronImage.width(12)
        chevronImage.centerYToSuperview()
        
        separatorView.leadingToSuperview(offset: 4)
        separatorView.trailingToSuperview(offset: 4)
        separatorView.bottomToSuperview()
        separatorView.height(0.5)
    }
    
    override func setup(data: ValueData) {
        super.setup(data: data)
        chevronImage?.image = data.isFolder ? UIImage(systemName: "chevron.right") : nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

