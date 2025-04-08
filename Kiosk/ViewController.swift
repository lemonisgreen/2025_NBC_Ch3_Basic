//
//  ViewController.swift
//  Kiosk
//
//  Created by JIN LEE on 4/7/25.
//

import UIKit

class ViewController: UIViewController {
    
    // collectionView 생성 및 Data를 담아둔 구조체의 인스턴스 생성
    var collectionView: CollectionView!
    let jeontongjooList = Jeontongjoo.list
    let wineList = Wine.list
    let sakeList = Sake.list
    
    // Segmented Controll을 누르면 바뀌며 collectionView를 전환하기 위한 변수
    var state = "wine"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor(named: "Main")
        
        // 세팅 활성화
        configure()
        registerCollectionView()
        delegatesOn()
    }


}

