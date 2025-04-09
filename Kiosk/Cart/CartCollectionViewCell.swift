//
//  CartCollectionViewCell.swift
//  Kiosk
//
//  Created by NH on 4/8/25.
//

import UIKit

class CartCollectionViewCell: UICollectionViewCell {
    let itemNameLabel: UILabel = {
        let label = UILabel()
        // 라벨 설정
        label.textAlignment = .left
        label.textColor = .font
        label.font = .systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let minusButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("-", for: .normal)
        button.setTitleColor(.font, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let itemCountLabel: UILabel = {
        let label = UILabel()
        // 라벨 설정
        label.textAlignment = .center
        label.textColor = .font
        label.font = .systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let plusButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("+", for: .normal)
        button.setTitleColor(.font, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let itemPriceLabel: UILabel = {
        let label = UILabel()
        // 라벨 설정
        label.textAlignment = .right
        label.textColor = .font
        label.font = .systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let separatorView: UIView = {
        let separatorView = UIView()
        
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.backgroundColor = UIColor.lightGray
        
        return separatorView
    }()
    
    // MARK: - 델리게이트 패턴
    weak var delegate: CartCollectionViewCellDelegate? // 왜 weak 쓰냐

    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 셀 디자인
        contentView.backgroundColor = .white
        contentView.clipsToBounds = true
        
        setItemNameLabel()
        setMinusButton()
        setItemCountLabel()
        setPlusButton()
        setItemPriceLabel()
        setSeparatorView()
        
        minusButton.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CartCollectionViewCell {
    // 셀 내용 설정 메소드
    func configure(itemName: String, quantity: Int) {
        itemNameLabel.text = itemName
        itemCountLabel.text = "\(quantity)"
    }
    
    func setItemNameLabel() {
        // 셀 안에 라벨 추가
        contentView.addSubview(itemNameLabel)
        
        // 오토레이아웃 설정
        NSLayoutConstraint.activate([
            itemNameLabel.widthAnchor.constraint(equalToConstant: 168),
            itemNameLabel.heightAnchor.constraint(equalToConstant: 18),
            itemNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            itemNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            itemNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
        ])
    }
    
    func setMinusButton() {
        // 셀 안에 라벨 추가
        contentView.addSubview(minusButton)
        
        // 오토레이아웃 설정
        NSLayoutConstraint.activate([
            minusButton.widthAnchor.constraint(equalToConstant: 8),
            minusButton.heightAnchor.constraint(equalToConstant: 18),
            minusButton.centerYAnchor.constraint(equalTo: itemNameLabel.centerYAnchor),
            minusButton.leadingAnchor.constraint(equalTo: itemNameLabel.trailingAnchor, constant: 16)
        ])
    }
    
    func setItemCountLabel() {
        // 셀 안에 라벨 추가
        contentView.addSubview(itemCountLabel)
        
        // 오토레이아웃 설정
        NSLayoutConstraint.activate([
            itemCountLabel.widthAnchor.constraint(equalToConstant: 25),
            itemCountLabel.heightAnchor.constraint(equalToConstant: 18),
            itemCountLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            itemCountLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            itemCountLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor, constant: 4)
        ])
    }
    
    func setPlusButton() {
        // 셀 안에 라벨 추가
        contentView.addSubview(plusButton)
        
        // 오토레이아웃 설정
        NSLayoutConstraint.activate([
            plusButton.widthAnchor.constraint(equalToConstant: 8),
            plusButton.heightAnchor.constraint(equalToConstant: 18),
            plusButton.centerYAnchor.constraint(equalTo: itemNameLabel.centerYAnchor),
            plusButton.leadingAnchor.constraint(equalTo: itemCountLabel.trailingAnchor, constant: 4)
        ])
    }
    
    func setItemPriceLabel() {
        contentView.addSubview(itemPriceLabel)
        
        // 오토레이아웃 설정
        NSLayoutConstraint.activate([
            itemPriceLabel.widthAnchor.constraint(equalToConstant: 72),
            itemPriceLabel.heightAnchor.constraint(equalToConstant: 18),
            itemPriceLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            itemPriceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            itemPriceLabel.leadingAnchor.constraint(equalTo: plusButton.trailingAnchor, constant: 10)
            //itemPriceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func setSeparatorView() {
        contentView.addSubview(separatorView)
        
        NSLayoutConstraint.activate([
            // separatorView는 셀 맨 아래에 가로로 얇게
            separatorView.widthAnchor.constraint(equalToConstant: 318),
            separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    // 가격에 콤마 넣기
    func convertToCurrencyFormat(price: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        let result = numberFormatter.string(from: NSNumber(value: price)) ?? ""
        return result
    }
    
    @objc func minusButtonTapped() {
        delegate?.didTapMinusButton(in: self)
    }
    
    @objc func plusButtonTapped() {
        delegate?.didTapPlusButton(in: self)
    }
}
