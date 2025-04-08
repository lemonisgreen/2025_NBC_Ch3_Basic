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
}
