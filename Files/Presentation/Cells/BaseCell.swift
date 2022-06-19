//
//  BaseCellCollectionViewCell.swift
//  Files
//
//  Created by maks on 19.06.2022.
//

import UIKit

class BaseCell: UICollectionViewCell {
    
    var imageView: UIImageView!
    var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        
        label = UILabel()
        addSubview(label)
    }
    
    func setup(data: ValueData) {
        label.text = data.name
        imageView.image = data.isFolder ? UIImage(systemName: "folder") : UIImage(systemName: "doc.richtext")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
