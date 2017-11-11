//
//  FormCollectionHeaderView.swift
//  JPForm
//
//  Created by Jimmy Pham on 11/10/17.
//  Copyright © 2017 Jimmy Pham. All rights reserved.
//

import UIKit
import SnapKit

class FormCollectionHeaderView: UICollectionReusableView {
    
    private let headerLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        backgroundColor = .red
        
        addSubview(headerLabel)
        headerLabel.textColor = .white
        headerLabel.font = .systemFont(ofSize: 18, weight: .bold)
        headerLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    
    func setHeaderText(_ text: String?) {
        headerLabel.text = text
    }
}
