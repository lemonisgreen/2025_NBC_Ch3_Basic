//
//  Wine.swift
//  Kiosk
//
//  Created by 최규현 on 4/8/25.
//

struct Wine {
    var name: String
    var price: Int
    var sale: Int
    var originalPrice: Int
    var imageName: String
    var infoName: String = "종류\n용량\n도수\n맛"
    var info: String
}

extension Wine {
    static let list: [Wine] = [
        Wine(name: "Sexual Chocolate",
             price: 51900,
             sale: 17,
             originalPrice: 63000,
             imageName: "chocolate",
             info: "레드 와인\n750ml\n14.5%\n풍부한 다크 프루트,\n약간의 시나몬과 스파이스,\n실키한 택스처"),
        Wine(name: "Bottega Moscato Petalo",
             price: 27100,
             sale: 39,
             originalPrice: 45000,
             imageName: "bottega",
             info: "스파클링 와인\n750ml\n6%\n적당한 산미, 과일"),
        Wine(name: "Chateau Montus Rouge 2017",
             price: 83300,
             sale: 16,
             originalPrice: 100000,
             imageName: "chateau",
             info: "레드 와인\n750ml\n14%\n잘 익은 다크 베리, 다크 초콜릿,\n삼나무, 미묘한 허브와 스파이스"),
        Wine(name: "Tussock Jumper, Rabbit Moscato",
             price: 12900,
             sale: 59,
             originalPrice: 32000,
             imageName: "tussock",
             info: "화이트 와인\n750ml\n11%\n레몬, 청포도, 부드러운"),
        Wine(name: "Condor Peak Cabernet Sauvignon",
             price: 7200,
             sale: 40,
             originalPrice: 1200,
             imageName: "condor",
             info: "레드 와인\n750ml\n13%\n부드러운 탄닌, 신선한 과일의 풍미")
    ]
}
