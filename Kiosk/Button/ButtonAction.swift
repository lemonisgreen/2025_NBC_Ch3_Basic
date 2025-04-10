//
//  ButtonAction.swift
//  Kiosk
//
//  Created by 최규현 on 4/9/25.
//

import UIKit

extension ViewController {
    
    // MARK: - Order Button Action
    @objc func orderButtonTapped() {
        guard cartItems.count > 0 else {
            let notice = UIAlertController(title: "알림🔔", message: "장바구니가 비어있습니다.\n확인 후 다시 주문해주세요.", preferredStyle: .alert)
            present(notice, animated: true)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                notice.dismiss(animated: true)
            }
            return
        }
        
        let orderAlert = UIAlertController(title: "주문하기", message: "주문하시겠습니까?", preferredStyle: .alert)
        let successAlert = UIAlertController(title: "주문 완료!", message: "주문이 완료되었습니다.", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "네", style: .default) { _ in
//            self.cartItems.forEach { orderHistory.append($0) }
            
            self.cartItems = []
            self.calculateCartSummary()
            self.cartCollectionView.reloadData()
            self.present(successAlert, animated: true)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                successAlert.dismiss(animated: true)
            }
        }
        
        let cancelAction = UIAlertAction(title: "아니요", style: .cancel, handler: nil)
        
        orderAlert.addAction(yesAction)
        orderAlert.addAction(cancelAction)
        
        present(orderAlert, animated: true)
    }
    
    // MARK: - Cancel Button Action
    @objc func cancelButtonTapped() {
        guard cartItems.count > 0 else {
            let notice = UIAlertController(title: "알림🔔", message: "이미 장바구니가 비어있습니다.", preferredStyle: .alert)
            present(notice, animated: true)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                notice.dismiss(animated: true)
            }
            return
        }
        
        let cancelAlert = UIAlertController(title: "주문 취소", message: "주문을 취소하시겠습니까?", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "네", style: .default) { _ in
            self.cartItems = []
            self.calculateCartSummary()
            self.cartCollectionView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "아니요", style: .cancel, handler: nil)
        
        cancelAlert.addAction(yesAction)
        cancelAlert.addAction(cancelAction)
        
        present(cancelAlert, animated: true)
    }
}
