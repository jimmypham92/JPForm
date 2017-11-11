//
//  JPCollectionViewLayout.swift
//  JPForm
//
//  Created by Jimmy Pham on 11/10/17.
//  Copyright © 2017 Jimmy Pham. All rights reserved.
//

import UIKit

class JPCollectionViewLayout: UICollectionViewFlowLayout {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(w: CGFloat, h: CGFloat) {
        super.init()
        sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        itemSize = CGSize(width: w, height: h)
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
    }
}
