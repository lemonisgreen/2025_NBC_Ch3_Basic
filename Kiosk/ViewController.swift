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
    
    let totalItemLabel: UILabel = {
        let label = UILabel()
        
        label.text = "총 0개"
        label.textAlignment = .left
        label.textColor = .font
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
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
    
    var cartItems: [CartItem] = [] // 장바구니 상품 저장 배열
    
    // MARK: -  >>>>>>>>>>>>>>>>> 명노훈 총 가격 <<<<<<<<<<<<<<<<<<<<<<<<<
//    let totalPriceLabel: UILabel = {
//        let label = UILabel()
//        
//        label.text = "총 금액"
//        label.textColor = .font
//        label.textAlignment = .left
//        label.font = .boldSystemFont(ofSize: 20)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        
//        return label
//    }()
//    
//    let totalPriceView: UIView = {
//        let view = UIView()
//        
//        view.backgroundColor = .sub3
//        view.layer.cornerRadius = 20
//        view.translatesAutoresizingMaskIntoConstraints = false
//        
//        //view.addSubview(totalPriceLabel)
//        
//        return view
//    }()
    
//    func makeTotoalPriceLabel() -> UILabel {
//        let label = UILabel()
//        
//        label.text = "총 금액"
//        label.textColor = .font
//        label.textAlignment = .left
//        label.font = .boldSystemFont(ofSize: 20)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        
//        
//        
//        return label
//    }
//    
//    func makeTotalPriceView() -> UIView {
//        let view = UIView()
//        
//        view.backgroundColor = .sub3
//        view.layer.cornerRadius = 20
//        view.translatesAutoresizingMaskIntoConstraints = false
//        
//        //view.addSubview(totalPriceLabel)
//        
//        return view
//    }
//    
//    func setTotalPriceView() {
//        let label = makeTotoalPriceLabel()
//        let totalPriceView = makeTotalPriceView()
//        
//        view.addSubview(totalPriceView)
//        
//        totalPriceView.addSubview(label)
//        
//        NSLayoutConstraint.activate([
//                label.leadingAnchor.constraint(equalTo: totalPriceView.leadingAnchor, constant: 16),
//                label.centerYAnchor.constraint(equalTo: totalPriceView.centerYAnchor)
//            ])
//        
//        
//        NSLayoutConstraint.activate([
//            totalPriceView.heightAnchor.constraint(equalToConstant: 46),
//            totalPriceView.topAnchor.constraint(equalTo: cartCollectionView.bottomAnchor, constant: 16),
//            totalPriceView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
//            totalPriceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
//            totalPriceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12)
//        ])
//    }
    
    
    func makeTotalPriceView() -> UIStackView {
        // 왼쪽 라벨
        let titleLabel = UILabel()
        titleLabel.text = "총 금액:"
        titleLabel.textColor = .black
        titleLabel.font = .boldSystemFont(ofSize: 20)

        // 오른쪽 금액 라벨
        let amountLabel = UILabel()
        amountLabel.text = "100,000 원"
        amountLabel.textColor = .black
        amountLabel.font = .systemFont(ofSize: 20)
        amountLabel.textAlignment = .right

        // StackView 구성
        let stackView = UIStackView(arrangedSubviews: [titleLabel, amountLabel])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false

        // 배경 뷰처럼 스타일 주기 위해 layer 직접 적용
        stackView.backgroundColor = .sub3
        stackView.layer.cornerRadius = 20
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)

        return stackView
    }
    
    func setTotalPriceView() {
        let totalPriceStackView = makeTotalPriceView()
        view.addSubview(totalPriceStackView)

        NSLayoutConstraint.activate([
            totalPriceStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            totalPriceStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            totalPriceStackView.heightAnchor.constraint(equalToConstant: 46),
            totalPriceStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
    }
    
    // MARK: - >>>>>>>>>>>>>>>>> 최규현 메뉴 화면 <<<<<<<<<<<<<<<<<<<<<<<<<
    
    // collectionView 생성 및 Data를 담아둔 구조체의 인스턴스 생성
    var collectionView: CollectionView!
    let jeontongjooList = Jeontongjoo.list
    let wineList = Wine.list
    let sakeList = Sake.list
    
    // Segmented Controll을 누르면 바뀌며 collectionView를 전환하기 위한 변수
    var state = "sake"
    
    // MARK: - >>>>>>>>>>>>>>>>> 최규현 버튼 생성 <<<<<<<<<<<<<<<<<<<<<<<<<
    let orderButton = UIButton()
    let cancelButton = UIButton()
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
        setCartLabel()
        setTotalItemLabel()
        setCollectionView()
        
        // MARK: - 총 금액
        setTotalPriceView()
    }
}

