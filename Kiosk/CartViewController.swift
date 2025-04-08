//
//  CartViewController.swift
//  Kiosk
//
//  Created by NH on 4/8/25.
//

import UIKit

class CartViewController: UIViewController {
    // MARK: - 라벨 속성 정의
    let label: UILabel = {
        let label = UILabel()
        
        label.text = "장바구니"
        label.textAlignment = .center
        label.textColor = .font
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setLabel()
    }
    
    private func setUI() {
        view.backgroundColor = .main
    }
}

