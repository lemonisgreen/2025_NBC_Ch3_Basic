//
//  CustomSegmentedcontrolViewController.swift
//  Kiosk
//
//  Created by JIN LEE on 4/8/25.
//

import UIKit

class CustomSegmentedControlView: UIView {
    
    // MARK: - Properties
    
    private let segmentedControl: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["와인", "사케", "전통주"])
        
        segment.selectedSegmentIndex = 0
        
        segment.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.gray.withAlphaComponent(0.7),
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .regular)
        ], for: .normal)
        
        segment.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .semibold)
        ], for: .selected)
        
        segment.selectedSegmentTintColor = .clear
        segment.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        segment.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        
        segment.translatesAutoresizingMaskIntoConstraints = false
        
        return segment
    }()
    
    private let underLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .sub1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var underLineLeadingConstraint: NSLayoutConstraint! // 언더바 leading 제약 조건
    
    var segmentChangedHandler: ((Int) -> Void)? // 상태 변경 핸들러
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(segmentedControl)
        addSubview(underLineView)
        
        NSLayoutConstraint.activate([
            segmentedControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            segmentedControl.centerYAnchor.constraint(equalTo: centerYAnchor),
            segmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            segmentedControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            segmentedControl.heightAnchor.constraint(equalToConstant: 26),
        ])
        
        underLineLeadingConstraint = underLineView.leadingAnchor.constraint(equalTo: segmentedControl.leadingAnchor, constant: 33)
        
        NSLayoutConstraint.activate([
            underLineView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 1),
            underLineLeadingConstraint,
            underLineView.widthAnchor.constraint(equalToConstant: 50),
            underLineView.heightAnchor.constraint(equalToConstant: 3)
        ])
        
        segmentedControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
    }
    
    // MARK: - Action
    
    @objc private func segmentChanged(_ sender: UISegmentedControl) {
        let segmentWidth = segmentedControl.frame.width / CGFloat(segmentedControl.numberOfSegments)
        let newLeadingConstant = (segmentWidth * CGFloat(sender.selectedSegmentIndex)) + (segmentWidth - 50) / 2
        
        underLineLeadingConstraint.constant = newLeadingConstant
        
        UIView.animate(withDuration: 0.2) {
            self.layoutIfNeeded()
        }
        
        segmentChangedHandler?(sender.selectedSegmentIndex)
    }
}
