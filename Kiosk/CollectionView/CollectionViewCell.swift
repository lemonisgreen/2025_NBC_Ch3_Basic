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
    
    // 이거 ViewController에서 컬렉션뷰 설정할 때 쓰긴 하는데 정확하게 뭔지는 잘 모름
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // 뭔지모름,,
    required init?(coder: NSCoder) {
        fatalError("Error(coder: NSCoder)")
    }
    
    // 셀 안에 들어갈 UI 생성
    var nameLabel = UILabel()
    var priceLabel = UILabel()
    var saleLabel = UILabel()
    var originalPriceLabel = UILabel()
    var infoLabel = UILabel()
    var imageView = UIImageView()
    
    // UI세팅 메서드
    func configure(_ item: Jeontongjoo) {
        [nameLabel, priceLabel, saleLabel, originalPriceLabel, infoLabel]
            .forEach {
                $0.translatesAutoresizingMaskIntoConstraints = false
                $0.textColor = .black
            }
        
        nameLabel.font = .boldSystemFont(ofSize: 14)
        nameLabel.textColor = UIColor(named: "Sub2")
        
        priceLabel.font = .boldSystemFont(ofSize: 12)
        
        saleLabel.font = .boldSystemFont(ofSize: 12)
        saleLabel.textColor = UIColor(named: "Sub1")
        
        originalPriceLabel.font = .systemFont(ofSize: 6)
        
        infoLabel.font = .systemFont(ofSize: 10)
        infoLabel.numberOfLines = 0
        
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.text = item.name
        priceLabel.text = "\(item.price)원"
        saleLabel.text = "\(item.sale)%"
        originalPriceLabel.text = "\(item.originalPrice)원"
        infoLabel.text = item.info
        imageView.image = UIImage(named: item.imageName)
        
        [nameLabel, priceLabel, saleLabel, originalPriceLabel, infoLabel, imageView]
            .forEach { contentView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -8),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -8),
            
            infoLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            infoLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: 8),
            
            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            saleLabel.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor, constant: -4),
            saleLabel.bottomAnchor.constraint(equalTo: priceLabel.bottomAnchor),
            
            originalPriceLabel.trailingAnchor.constraint(equalTo: priceLabel.trailingAnchor),
            originalPriceLabel.bottomAnchor.constraint(equalTo: priceLabel.topAnchor, constant: -4)
            ])
    }
}
