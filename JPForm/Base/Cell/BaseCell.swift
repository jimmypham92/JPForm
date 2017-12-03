//
//  BaseCell.swift
//  JPForm
//
//  Created by Jimmy Pham on 11/10/17.
//  Copyright © 2017 Jimmy Pham. All rights reserved.
//

import UIKit

open class BaseCell: UICollectionViewCell {
    
    internal let mainLabel: UILabel
    
    override init(frame: CGRect) {
        self.mainLabel = UILabel()
        super.init(frame: frame)
        
        layout()
        config()
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
    
    internal func updateDataWithIndexPath(_ indexPath: IndexPath) {}
    internal func config() {}
}
