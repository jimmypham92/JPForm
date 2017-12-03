//
//  HeaderLogCell.swift
//  JPForm
//
//  Created by Jimmy Pham on 11/10/17.
//  Copyright © 2017 Jimmy Pham. All rights reserved.
//

import UIKit
import SnapKit

class HeaderLogCell: BaseCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func config() {
        backgroundColor = .red
        mainLabel.textColor = .white
        mainLabel.font = .systemFont(ofSize: 18, weight: .bold)
        mainLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(8)
        }
    }
    
    override func updateDataWithIndexPath(_ indexPath: IndexPath) {
        mainLabel.text = "UNIT LOG"
    }
    
}
