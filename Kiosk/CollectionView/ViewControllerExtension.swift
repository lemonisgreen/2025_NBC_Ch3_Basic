//
//  ViewController.swift
//  das
//
//  Created by 최규현 on 4/7/25.
//

import UIKit

extension ViewController {
    
    // 초기 세팅
    func configure() {
        
        // 컬렉션 뷰 플로우 레이아웃 세팅
        let collectionViewLayer = UICollectionViewFlowLayout()
        collectionViewLayer.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        collectionViewLayer.minimumLineSpacing = 5
        collectionViewLayer.minimumInteritemSpacing = 1
        
        // 이거 CollectionViewCell에서 init해줬던 frame
        let collectionView = CollectionView(frame: .zero, collectionViewLayout: collectionViewLayer)
        collectionView.backgroundColor = .white
        collectionView.layer.cornerRadius = 20
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(collectionView)
        
        // 오토레이아웃 설정
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            collectionView.heightAnchor.constraint(equalToConstant: 310)
        ])
        
        self.collectionView = collectionView
    }
    
    // identifier 설정(CollectionViewCell에서 만들었던 id 사용)
    func registerCollectionView() {
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.id)
    }
    
    // delegate, dataSource 설정
    func delegatesOn() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}
