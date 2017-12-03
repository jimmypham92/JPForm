//
//  UnitLogCell.swift
//  JPForm
//
//  Created by Jimmy Pham on 11/10/17.
//  Copyright © 2017 Jimmy Pham. All rights reserved.
//

import UIKit
import SnapKit

class UnitLogCell: BaseCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func config() {
        mainLabel.font = .systemFont(ofSize: 12, weight: .regular)
        mainLabel.snp.makeConstraints { (make) in
            make.left.top.equalTo(4)
        }
    }
    
    override func updateDataWithIndexPath(_ indexPath: IndexPath) {
        mainLabel.text = "Item: \(indexPath.item)"
    }
}
