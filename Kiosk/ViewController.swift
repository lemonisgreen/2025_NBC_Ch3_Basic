//
//  ViewController.swift
//  Kiosk
//
//  Created by JIN LEE on 4/7/25.
//

import UIKit

class ViewController: UIViewController {
    // MARK: -  >>>>>>>>>>>>>>>>> 명노훈 장바구니 <<<<<<<<<<<<<<<<<<<<<<<<<
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
        //layout.itemSize = CGSize(width: 351, height: 40) // 셀 크기 설정
        
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
    
    var cartItems: [String] = []
    
    // MARK: - >>>>>>>>>>>>>>>>> 최규현 메뉴 화면 <<<<<<<<<<<<<<<<<<<<<<<<<
    
    // collectionView 생성 및 Data를 담아둔 구조체의 인스턴스 생성
    var collectionView: CollectionView!
    let jeontongjooList = Jeontongjoo.list
    let wineList = Wine.list
    let sakeList = Sake.list
    
    // Segmented Controll을 누르면 바뀌며 collectionView를 전환하기 위한 변수
    var state = "sake"
}


// MARK: - Lifecycle
extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Main")
        
        // 세팅 활성화
        configure()
        registerCollectionView()
        delegatesOn()
        
        // MARK: - 명노훈 장바구니
        setUI()
        setLabel()
        setCollectionView()
    }
}

