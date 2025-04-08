//
//  Wine.swift
//  Kiosk
//
//  Created by 최규현 on 4/8/25.
//

struct Wine {
    var name: String
    var subName: String
    var price: Int
    var sale: Int
    var originalPrice: Int
    var imageName: String
    var info: String
}

extension Wine {
    static let list: [Wine] = [
        Wine(name: "Sexual Chocolate",
             subName: "섹슈얼 초콜릿",
             price: 51900,
             sale: 17,
             originalPrice: 63000,
             imageName: "chocolate",
             info: """
                종류: 레드 와인
                용량: 750ml
                도수: 14.5%
                맛: 풍부한 다크 프루트,
                   약간의 시나몬과 스파이스,
                   실키한 택스처
                """)
    ]
}
