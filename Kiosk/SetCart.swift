//
//  SetCart.swift
//  Kiosk
//
//  Created by NH on 4/8/25.
//

import UIKit

extension CartViewController {
    // 장바구니 표시하는 라벨 설정
    func setLabel() {
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.widthAnchor.constraint(equalToConstant: 100),
            label.heightAnchor.constraint(equalToConstant: 24),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 491),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
    }
}
