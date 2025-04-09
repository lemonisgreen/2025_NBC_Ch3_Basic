//
//  Sake.swift
//  Kiosk
//
//  Created by 최규현 on 4/8/25.
//

struct Sake {
    var name: String
    var price: Int
    var sale: Int
    var originalPrice: Int
    var imageName: String
    var infoName: String = "종류\n용량\n도수\n맛"
    var info: String
}

extension Sake {
    static let list: [Sake] = [
        Sake(name: "Hana Gizakura Junmaiginzo",
             price: 22800,
             sale: 21,
             originalPrice: 29000,
             imageName: "hana",
             info: "사케\n720ml\n12%\n달달한 과실, 풍부한"),
        Sake(name: "Kubota Senjyu",
             price: 39200,
             sale: 34,
             originalPrice: 60000,
             imageName: "kubota",
             info: "사케\n720ml\n15.5%\n과실맛, 부드러운 목넘김"),
        Sake(name: "Sakura Junmai",
             price: 25000,
             sale: 44,
             originalPrice: 45000,
             imageName: "sakura",
             info: "사케 - 준마이\n720ml\n16%\n허브, 소테 야채,\n버섯, 고기와 잘 어울림"),
        Sake(name: "Tsuru-ume Yuzu",
             price: 48300,
             sale: 24,
             originalPrice: 64000,
             imageName: "yuzu",
             info: "사케\n720ml\n7%\n달콤한, 상큼한, 유자"),
        Sake(name: "BIZAN CLEAR",
             price: 24300,
             sale: 13,
             originalPrice: 28000,
             imageName: "bizan",
             info: "일본 소주\n720ml\n25%\n쌀, 은은한, 구수한, 부드러운")
    ]
}
