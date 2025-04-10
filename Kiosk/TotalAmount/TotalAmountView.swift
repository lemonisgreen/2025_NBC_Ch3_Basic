//
//  TotalAmountViewController.swift
//  Kiosk
//
//  Created by NH on 4/9/25.
//

import UIKit

extension ViewController {
    func setTotalPriceView() {
        view.addSubview(totalAmountStackView)

        NSLayoutConstraint.activate([
            totalAmountStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            totalAmountStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            totalAmountStackView.heightAnchor.constraint(equalToConstant: 46),
            totalAmountStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
    }
    
    // 총 금액 업데이트 메소드
    func updateTotalPrice(to newPrice: Int) {
        totalAmountLabel.text = "\(convertToCurrencyFormat(price: newPrice)) 원"
    }

    // 총 수량 업데이트 메소드
    func updateTotalQuantity(to newQuantity: Int) {
        totalItemLabel.text = "총 \(newQuantity)개"
    }
    
    // 총 금액 및 총 수량 업데이트 함수
    func calculateCartSummary() {
        let total = cartItems.reduce(0) { $0 + ($1.item.price * $1.quantity) }
        let quantity = cartItems.reduce(0) { $0 + $1.quantity }

        updateTotalPrice(to: total)
        updateTotalQuantity(to: quantity)
    }
    
    // 가격에 콤마 넣기
    func convertToCurrencyFormat(price: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        let result = numberFormatter.string(from: NSNumber(value: price)) ?? ""
        return result
    }
}

