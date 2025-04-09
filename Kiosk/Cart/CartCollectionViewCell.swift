//
//  CartCollectionViewCell.swift
//  Kiosk
//
//  Created by NH on 4/8/25.
//

import UIKit

class CartCollectionViewCell: UICollectionViewCell {
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 셀 디자인
        contentView.backgroundColor = .white
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
