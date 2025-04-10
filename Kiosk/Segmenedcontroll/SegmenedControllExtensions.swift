//
//  SegmenedControllExtensions.swift
//  Kiosk
//
//  Created by JIN LEE on 4/10/25.
//

import UIKit

extension UIViewController {
    func setupCustomSegmentedControl(_ control: CustomSegmentedControlView, in containerView: UIView, topOffset: CGFloat = 75) {
        containerView.addSubview(control)
        
        control.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            control.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: topOffset),
            control.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            control.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
            control.heightAnchor.constraint(equalToConstant: 26)
        ])
    }
}
