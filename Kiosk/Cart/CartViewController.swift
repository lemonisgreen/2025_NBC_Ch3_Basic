//
//  CartViewController.swift
//  Kiosk
//
//  Created by NH on 4/8/25.
//

import UIKit

class CartViewController: UIViewController {
    // MARK: - Properties
    let cartlabel: UILabel = {
        let label = UILabel()
        
        label.text = "장바구니"
        label.textAlignment = .left
        label.textColor = .font
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // MARK: - 컬렉션 뷰 인스턴스 정의
    lazy var cartCollectionView: UICollectionView = {
        // 1. 셀의 배치를 정해주는 레이아웃 객체 생성
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical // 세로 방향 스크롤
        layout.minimumLineSpacing = 0 // 셀 사이의 간격 (줄 간격)
        layout.itemSize = CGSize(width: 351, height: 40) // 셀 크기 설정
        
        // 2. 컬렉션 뷰 생성
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = .white // 배경색 지정
        
        // 3. 델리게이트, 데이터소스 연결
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.layer.cornerRadius = 20 // 둥굴게 설정
        collectionView.translatesAutoresizingMaskIntoConstraints = false // 오토레이아웃 설정
        
        // 4. 커스텀 셀 등록
        collectionView.register(CartCollectionViewCell.self, forCellWithReuseIdentifier: "CartCell")
        return collectionView
    }()
}

// MARK: - Lifecycle
extension CartViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLabel()
        setCollectionView()
    }
}

private extension CartViewController {
    func setUI() {
        view.backgroundColor = .main
    }
    
    // MARK: - 장바구니 라벨 오토 레이아웃
    func setLabel() {
        view.addSubview(cartlabel)
        
        NSLayoutConstraint.activate([
            cartlabel.widthAnchor.constraint(equalToConstant: 100),
            cartlabel.heightAnchor.constraint(equalToConstant: 24),
            cartlabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 491),
            cartlabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
    }
    
    // MARK: - 컬렉션 뷰 오토 레이아웃
    func setCollectionView() {
        view.addSubview(cartCollectionView)
        
        // 오토레이아웃 설정
        NSLayoutConstraint.activate([
            cartCollectionView.widthAnchor.constraint(equalToConstant: 351),
            cartCollectionView.heightAnchor.constraint(equalToConstant: 130),
            cartCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 520),
            cartCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12)
        ])
    }
}

// MARK: - 컬렉션 뷰 데이터소스
extension CartViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0 // 아직 구현 안되서 초기값 설정
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CartCell", for: indexPath) as? CartCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        return cell // 아직 구현 안됨
    }
}

// MARK: - 컬렉션 뷰 델리게이트
extension CartViewController: UICollectionViewDelegate {
    
}
