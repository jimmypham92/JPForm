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
            return 6
        }
        return 30
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = indexPath.section
        let item = indexPath.item
        let row = indexPath.row
        
        if section == 0 && item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderLogCell", for: indexPath) as! HeaderLogCell
            return cell
        } else if section == 0 && item != 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UnitLogCell", for: indexPath) as! UnitLogCell
            cell.setLabelWithItem(item)
            return cell
        } else if section == 1 && row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UnitLogCell", for: indexPath) as! UnitLogCell
            cell.setLabelWithItem(item)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UnitLogCell", for: indexPath) as! UnitLogCell
            cell.setLabelWithItem(item)
            return cell
        }
    
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let reuseableView: UICollectionReusableView = UICollectionReusableView(frame: .zero)
        
        if indexPath.section == 0 {
            return reuseableView
        }
        
        if (kind == UICollectionElementKindSectionHeader) {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "JPHeader", for: indexPath) as! FormCollectionHeaderView
            
            if indexPath.row == 1 {
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
    
}
