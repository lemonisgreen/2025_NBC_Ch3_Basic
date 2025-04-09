//
//  CartCollectionViewCell.swift
//  Kiosk
//
//  Created by NH on 4/8/25.
//

import UIKit

class CartCollectionViewCell: UICollectionViewCell {
    private let itemNameLabel: UILabel = {
        let label = UILabel()
        // 라벨 설정
        label.textAlignment = .left
        label.textColor = .font
        label.font = .systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 셀 디자인
        contentView.backgroundColor = .white
        contentView.clipsToBounds = true
        
        setItemNameLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CartCollectionViewCell {
    // 외부에서 텍스트 설정할 수 있도록 메서드 제공
    func configure(itemName: String) {
        itemNameLabel.text = itemName
    }
    
    func setItemNameLabel() {
        // 셀 안에 라벨 추가
        contentView.addSubview(itemNameLabel)
        
        // 오토레이아웃 설정
        NSLayoutConstraint.activate([
            itemNameLabel.widthAnchor.constraint(equalToConstant: 168),
            itemNameLabel.heightAnchor.constraint(equalToConstant: 18),
            itemNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            itemNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            itemNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            //itemNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
