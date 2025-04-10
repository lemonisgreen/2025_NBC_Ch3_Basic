//
//  NameLabelExtention.swift
//  Kiosk
//
//  Created by JIN LEE on 4/10/25.
//

import UIKit

extension UIViewController {
    func addNameLabelView(to containerView: UIView, topOffset: CGFloat = 19, leadingOffset: CGFloat = 12) {
        let nameLabelView = NameLabelView()
        containerView.addSubview(nameLabelView)
        
        nameLabelView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabelView.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: topOffset),
            nameLabelView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: leadingOffset)
        ])
    }
}
