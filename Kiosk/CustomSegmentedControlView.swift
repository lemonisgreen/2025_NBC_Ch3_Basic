//
//  CustomSegmentedcontrolViewController.swift
//  Kiosk
//
//  Created by JIN LEE on 4/8/25.
//

import UIKit

class CustomSegmentedControlView: UIViewController {
    
    private let segmentedControl: UISegmentedControl = {
        let segment = UISegmentedControl()
        
        segment.insertSegment(withTitle: "와인", at: 0, animated: true)
        segment.insertSegment(withTitle: "사케", at: 1, animated: true)
        segment.insertSegment(withTitle: "전통주", at: 2, animated: true)
        segment.selectedSegmentIndex = 0
        
        segment.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.font.withAlphaComponent(0.7),
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .regular)
        ], for: .normal)
        
        segment.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.font,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .semibold)
        ], for: .selected)
        
        //
        segment.selectedSegmentTintColor = .clear
        segment.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        segment.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        
        segment.translatesAutoresizingMaskIntoConstraints = false
        
        return segment
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .main
        self.view.addSubview(segmentedControl)
        
        NSLayoutConstraint.activate([
            segmentedControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            segmentedControl.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            segmentedControl.heightAnchor.constraint(equalToConstant: 26)
        ])
    }
    
    
    
}
