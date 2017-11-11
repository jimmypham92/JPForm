//
//  TestCollectionViewCell.swift
//  JPForm
//
//  Created by Jimmy Pham on 11/10/17.
//  Copyright © 2017 Jimmy Pham. All rights reserved.
//

import UIKit
import SnapKit

class TestCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout
extension TestCollectionViewCell {
    fileprivate func layout() {
        let insideView = UIView()
        insideView.backgroundColor = .red
        
        contentView.addSubview(insideView)
        insideView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsetsMake(5, 5, 5, 5))
        }
        
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1.0
    }
}
