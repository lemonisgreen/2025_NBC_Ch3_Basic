//
//  CollectionViewCell.swift
//  asfsadfsdaf
//
//  Created by 최규현 on 4/7/25.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    // 나중에 identifier 이름으로 사용할 id를 생성
    static var id: String {
        guard let id = NSStringFromClass(Self.self).components(separatedBy: ".").last else { return "" }
        return id
    }
    
    // ViewController에서 셀을 생성할 때 사용하는 초기화 메서드
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // 스토리보드에서 셀을 만들 때 호출되는 초기화 메서드
    // 지금은 코드베이스이기 때문에 필요없음
    // 생성하지 않으면 오류 발생하기 때문에 fatalError로 막아둠
    required init?(coder: NSCoder) {
        fatalError("Error(coder: NSCoder)")
    }
    
    // 셀 안에 들어갈 UI 생성
    var nameLabel = UILabel()
    var priceLabel = UILabel()
    var saleLabel = UILabel()
    var originalPriceLabel = UILabel()
    var infoNameLabel = UILabel()
    var infoLabel = UILabel()
    var imageView = UIImageView()
    
    var separatedView = UIView()
    
    // UI세팅 메서드
    func configure() {
        
        nameLabel.font = .boldSystemFont(ofSize: 14)
        nameLabel.textColor = .sub2
        nameLabel.numberOfLines = 0
                
        priceLabel.font = .boldSystemFont(ofSize: 12)
        priceLabel.textColor = .font
        
        saleLabel.font = .boldSystemFont(ofSize: 12)
        saleLabel.textColor = .sub1
        
        originalPriceLabel.font = .systemFont(ofSize: 6)
        originalPriceLabel.textColor = .font
        
        infoNameLabel.font = .boldSystemFont(ofSize: 10)
        infoNameLabel.textColor = .font
        infoNameLabel.numberOfLines = 0
        
        infoLabel.font = .systemFont(ofSize: 10)
        infoLabel.textColor = .font
        infoLabel.numberOfLines = 0
        
        imageView.contentMode = .scaleAspectFit
        
        separatedView.backgroundColor = .lightGray
        
        [nameLabel, priceLabel, saleLabel, originalPriceLabel,
         infoNameLabel, infoLabel, imageView, separatedView]
            .forEach {
                $0.translatesAutoresizingMaskIntoConstraints = false
                contentView.addSubview($0)
            }
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 110),
            imageView.widthAnchor.constraint(equalToConstant: 80),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -8),
            
            infoNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            infoNameLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: 8),
            
            infoLabel.topAnchor.constraint(equalTo: infoNameLabel.topAnchor),
            infoLabel.leadingAnchor.constraint(equalTo: infoNameLabel.trailingAnchor, constant: 8),
            
            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            saleLabel.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor, constant: -4),
            saleLabel.bottomAnchor.constraint(equalTo: priceLabel.bottomAnchor),
            
            originalPriceLabel.trailingAnchor.constraint(equalTo: priceLabel.trailingAnchor),
            originalPriceLabel.bottomAnchor.constraint(equalTo: priceLabel.topAnchor, constant: -4),
            
            separatedView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            separatedView.heightAnchor.constraint(equalToConstant: 0.5),
            separatedView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            separatedView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
            ])
    }
    
    func setJeontongjoo(_ item: Jeontongjoo) {
        let attributeString = NSMutableAttributedString(string: "\(item.originalPrice)원")
        attributeString.addAttribute(.strikethroughStyle, value: 1, range: NSRange.init(location: 0, length: "\(item.originalPrice)원".count))
        
        nameLabel.text = item.name
        priceLabel.text = "\(item.price)원"
        saleLabel.text = "\(item.sale)%"
        originalPriceLabel.attributedText = attributeString
        infoLabel.text = item.info
        imageView.image = UIImage(named: item.imageName)
    }
    
    func setWine(_ item: Wine) {
        let attributeString = NSMutableAttributedString(string: "\(item.originalPrice)원")
        attributeString.addAttribute(.strikethroughStyle, value: 1, range: NSRange.init(location: 0, length: "\(item.originalPrice)원".count))
        
        nameLabel.text = item.name
        priceLabel.text = "\(item.price)원"
        saleLabel.text = "\(item.sale)%"
        originalPriceLabel.attributedText = attributeString
        infoLabel.text = item.info
        imageView.image = UIImage(named: item.imageName)
    }
    
    func setSake(_ item: Sake) {
        let attributeString = NSMutableAttributedString(string: "\(item.originalPrice)원")
        attributeString.addAttribute(.strikethroughStyle, value: 1, range: NSRange.init(location: 0, length: "\(item.originalPrice)원".count))
        
        nameLabel.text = item.name
        priceLabel.text = "\(item.price)원"
        saleLabel.text = "\(item.sale)%"
        originalPriceLabel.attributedText = attributeString
        infoNameLabel.text = item.infoName
        infoLabel.text = item.info
        imageView.image = UIImage(named: item.imageName)
    }
}
