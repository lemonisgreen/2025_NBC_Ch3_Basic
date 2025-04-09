//
//  ButtonAction.swift
//  Kiosk
//
//  Created by 최규현 on 4/9/25.
//

import UIKit

extension ViewController {
    
    @objc func orderButtonTapped() {
        
    }
    
    @objc func cancelButtonTapped() {
        let cancelAlert = UIAlertController(title: "주문 취소", message: "주문을 취소하시겠습니까?", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "네", style: .default) { _ in
            self.cartItems = []
            self.cartCollectionView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "아니요", style: .cancel, handler: nil)
        
        cancelAlert.addAction(yesAction)
        cancelAlert.addAction(cancelAction)
        
        present(cancelAlert, animated: true)
    }
}
