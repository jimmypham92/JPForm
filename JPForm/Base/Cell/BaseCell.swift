//
//  BaseCell.swift
//  JPForm
//
//  Created by Jimmy Pham on 11/10/17.
//  Copyright © 2017 Jimmy Pham. All rights reserved.
//

import UIKit

open class BaseCell: UICollectionViewCell {
    
    internal let mainLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func layout() {
        layer.borderColor = UIColor.blue.cgColor
        layer.borderWidth = 0.8
        backgroundColor = .white
        
        contentView.addSubview(mainLabel)
    }
}
