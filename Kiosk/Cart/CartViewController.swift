//
//  CartViewController.swift
//  Kiosk
//
//  Created by NH on 4/8/25.
//

import UIKit

extension ViewController {
    func setUI() {
        view.backgroundColor = .main
    }
    
    // MARK: - 장바구니 라벨 오토 레이아웃
    func setLabel() {
        view.addSubview(cartlabel)
        
        NSLayoutConstraint.activate([
            cartlabel.heightAnchor.constraint(equalToConstant: 24),
            cartlabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 491),
            cartlabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            cartlabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    // MARK: - 컬렉션 뷰 오토 레이아웃
    func setCollectionView() {
        view.addSubview(cartCollectionView)
        
        // 오토레이아웃 설정
        NSLayoutConstraint.activate([
            cartCollectionView.heightAnchor.constraint(equalToConstant: 130),
            cartCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 520),
            cartCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            cartCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12)
        ])
    }
}
