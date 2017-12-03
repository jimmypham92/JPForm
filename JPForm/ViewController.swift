//
//  ViewController.swift
//  JPForm
//
//  Created by Jimmy Pham on 11/10/17.
//  Copyright © 2017 Jimmy Pham. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }

}

// MARK: - Configure
extension ViewController {
    func configureCollectionView() {
        let flowLayout = JPCollectionViewLayout(w: view.frame.width / 3, h: 50)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .gray
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HeaderLogCell.self, forCellWithReuseIdentifier: "HeaderLogCell")
        collectionView.register(FormCollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "JPHeader")
        collectionView.register(UnitLogCell.self, forCellWithReuseIdentifier: "UnitLogCell")

        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview()
            make.top.equalTo(20)
        }
    }
}

// MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 7
        }
        return 30
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = indexPath.section
        let item = indexPath.item
        
        var cell: BaseCell
        
        switch (section, item) {
        case (0, 0):
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderLogCell", for: indexPath) as! HeaderLogCell
        case (0, let i) where i != 0:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UnitLogCell", for: indexPath) as! UnitLogCell
        case (1, 0):
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UnitLogCell", for: indexPath) as! UnitLogCell
        default:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UnitLogCell", for: indexPath) as! UnitLogCell
        }
    
        cell.updateDataWithIndexPath(indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let reuseableView: UICollectionReusableView = UICollectionReusableView(frame: .zero)
        
        if indexPath.section == 0 {
            return reuseableView
        }
        
        if (kind == UICollectionElementKindSectionHeader) {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "JPHeader", for: indexPath) as! FormCollectionHeaderView
            
            if indexPath.section == 1 {
                headerView.setHeaderText("Header A")
            } else {
                headerView.setHeaderText("Header B")
            }
            
            return headerView
        }
        
        return reuseableView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return .zero
        }
        
        return CGSize(width: view.frame.width, height: 40)
    }

}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let section = indexPath.section
        let item = indexPath.item
        let row = indexPath.row
        
        var size = CGSize(width: view.w / 3, height: 40)
        
        if section == 1 && item > 2 {
            return size
        }
        
        switch (section, item, row) {
        case (0, let i, _) where !(2...3).contains(i):
            size.height = 56
        case (1, 0...2, _):
            size.height = 56
        case (0, 2...3, _):
            size.width = view.w / 6
            size.height = 56
        case (2, 0, _):
            size.width = view.w / 6
            size.height = 56
        case (2, 1, _):
            size.width = view.w * 5 / 6
            size.height = 56
        case (2, let i, _) where i % 2 != 1:
            size.width = view.w / 6
        case (2, let i, _) where i % 2 == 1:
            size.width = view.w * 5 / 6
        default: break
            
        }
        
        return size
    }
}
