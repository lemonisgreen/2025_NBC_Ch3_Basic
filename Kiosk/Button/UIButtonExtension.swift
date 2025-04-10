//
//  UIButtonExtension.swift
//  Kiosk
//
//  Created by 최규현 on 4/9/25.
//

import UIKit

/*
 button.backgroundColor 로 백그라운드 컬러 생성 시
 버튼의 클릭 이펙트가 출력되지 않는 현상 개션을 위해
 버튼의 상태별 백그라운드 컬러를 지정할 수 있는 메서드를 생성
 */
extension UIButton {
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        
        UIGraphicsBeginImageContext(CGSize(width: 1.0, height: 1.0))
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.setFillColor(color.cgColor)
        context.fill(CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0))
        
        let backgroundImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        setBackgroundImage(backgroundImage, for: state)
    }
}
