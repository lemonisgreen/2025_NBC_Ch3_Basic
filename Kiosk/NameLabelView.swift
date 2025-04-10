//
//  NameLabelView.swift
//  Kiosk
//
//  Created by JIN LEE on 4/10/25.
//

import UIKit

class NameLabelView: UIView {
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "터치더주"
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 36, weight: .bold)
        label.layer.borderColor = UIColor.black.cgColor
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    let iconImage: UIImageView = {
        let icon = UIImageView(image: UIImage(named: "Icon"))
        icon.contentMode = .scaleAspectFit
        icon.layer.borderColor = UIColor.black.cgColor
        icon.translatesAutoresizingMaskIntoConstraints = false

        return icon
    }()
    
    // MARK: - Initializers
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupViews()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setupViews()
        }
    
    private func setupViews() {
            // 1. 스택뷰 생성 및 설정
            let stackView = UIStackView(arrangedSubviews: [iconImage, nameLabel])
            stackView.axis = .horizontal
            stackView.spacing = 1
            stackView.alignment = .leading
            
            // 2. 스택뷰 추가
            addSubview(stackView)
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            // 3. 제약조건 설정
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: topAnchor),
                stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
                stackView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
                stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
                stackView.heightAnchor.constraint(equalToConstant: 44),
                
                iconImage.widthAnchor.constraint(equalToConstant: 44),
                iconImage.heightAnchor.constraint(equalToConstant: 44)
            ])
        }
    }
