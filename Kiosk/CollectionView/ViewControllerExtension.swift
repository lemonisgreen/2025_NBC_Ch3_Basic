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
//        collectionViewLayer.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        collectionViewLayer.minimumLineSpacing = 0
        
        // 이거 CollectionViewCell에서 init해줬던 frame
        let collectionView = CollectionView(frame: .zero, collectionViewLayout: collectionViewLayer)
        collectionView.backgroundColor = .white
        collectionView.layer.cornerRadius = 20
        
        self.collectionView = collectionView
        
        cancelButton.setTitle("주문 취소", for: .normal)
        cancelButton.setBackgroundColor(.sub2, for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        
        orderButton.setTitle("주문 하기", for: .normal)
        orderButton.setBackgroundColor(.sub1, for: .normal)
        orderButton.addTarget(self, action: #selector(orderButtonTapped), for: .touchUpInside)
        
        [orderButton, cancelButton]
            .forEach {
                $0.titleLabel?.font = .boldSystemFont(ofSize: 20)
                $0.setTitleColor(.main, for: .normal)
                $0.layer.cornerRadius = 21.5
                $0.layer.masksToBounds = true
            }
        
        [collectionView, orderButton, cancelButton]
            .forEach {
                $0.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview($0)
            }
        
        // 오토레이아웃 설정
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            collectionView.heightAnchor.constraint(equalToConstant: 310),
            
            cancelButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            cancelButton.widthAnchor.constraint(equalToConstant: 168),
            cancelButton.heightAnchor.constraint(equalToConstant: 43),
            
            orderButton.bottomAnchor.constraint(equalTo: cancelButton.bottomAnchor),
            orderButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            orderButton.widthAnchor.constraint(equalToConstant: 168),
            orderButton.heightAnchor.constraint(equalToConstant: 43)
        ])
        
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
