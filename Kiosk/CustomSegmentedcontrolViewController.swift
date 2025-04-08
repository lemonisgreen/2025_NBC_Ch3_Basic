//
//  CustomSegmentedcontrolViewController.swift
//  Kiosk
//
//  Created by JIN LEE on 4/8/25.
//

import UIKit

class CustomSegmentedcontrolViewController: UIViewController {
    let nane = UILabel()
    
    private let segmentedcontrol: UISegmentedControl = {
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
        
        segment.selectedSegmentTintColor = .clear
        
        return segment
    }()

   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(segmentedcontrol)
        
        func name() {
            nane.text = "안녕하세요"
            nane.textColor = .font
            
        }
       
    }
    


}
