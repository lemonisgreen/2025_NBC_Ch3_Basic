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
    // 왼쪽 총금액 표시 라벨
    let totalAmountTitleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "총 금액"
        label.textColor = .font
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // 오른쪽 금액 라벨
    let totalAmountLabel: UILabel = {
        let label = UILabel()
        
        label.text = "0 원"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // 총금액 스택뷰
    lazy var totalAmountStackView: UIStackView = {
        // StackView 구성
        
        // 클로저로 생성한 객체는 미리 메모리에 올라가서 self를 못 건드림.
        // 따라서 lazy var 로 선언해줘야됨
        let stackView = UIStackView(arrangedSubviews: [totalAmountTitleLabel, totalAmountLabel])
        
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
    }()
    
    
    // MARK: - >>>>>>>>>>>>>>>>> 최규현 메뉴 화면 <<<<<<<<<<<<<<<<<<<<<<<<<
    
    // collectionView 생성 및 Data를 담아둔 구조체의 인스턴스 생성
    var collectionView: CollectionView!
    let jeontongjooList = Jeontongjoo.list
    let wineList = Wine.list
    let sakeList = Sake.list
    
    // Segmented Controll을 누르면 바뀌며 collectionView를 전환하기 위한 변수
    var state = "wine" {
        didSet {
            collectionView.reloadData()
        }
    }
    
    // MARK: - >>>>>>>>>>>>>>>>> 최규현 버튼 생성 <<<<<<<<<<<<<<<<<<<<<<<<<
    let orderButton = UIButton()
    let cancelButton = UIButton()
    
    
    // MARK: - >>>>>>>>>>>>>>>>> 이정진 네임라벨 & 세그먼티드 컨트롤 <<<<<<<<<<<<<<<<<<<<
    
    let customSegmentedControl = CustomSegmentedControlView() // 커스텀 Segmented Control
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
        
        // MARK: - 장바구니 View 활성화
        setUI()
        setCartLabel()
        setTotalItemLabel()
        setCollectionView()
        
        // MARK: - 총 금액 View 활성화
        setTotalPriceView()
        
        // MARK: - 커스텀 세그먼티드 컨트롤 활성화
        
        setupCustomSegmentedControl(customSegmentedControl, in: view)
        
        // Segment Changed Handler 설정
        customSegmentedControl.segmentChangedHandler = { [weak self] selectedIndex in
            guard let self = self else { return }
            
            switch selectedIndex {
            case 0:
                self.state = "wine"
            case 1:
                self.state = "sake"
            case 2:
                self.state = "jeontongjoo"
            default:
                break
            }
            
            self.cartCollectionView.reloadData() // 데이터 새로고침
        }
        
        // MARK: - 네임라벨 추가
        
        addNameLabelView(to: view)
    }
}
