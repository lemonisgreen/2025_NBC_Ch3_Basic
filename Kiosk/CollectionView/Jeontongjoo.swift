//
//  Jeontongjoo.swift
//  asfsadfsdaf
//
//  Created by 최규현 on 4/7/25.
//

struct Jeontongjoo {
    var name: String
    var price: Int
    var sale: Int
    var originalPrice: Int
    var imageName: String
    var infoName: String = "종류\n용량\n도수\n맛"
    var info: String
}

extension Jeontongjoo {
    static let list: [Jeontongjoo] = [
        Jeontongjoo(name: "호랑이가 사랑한 단감, 호감",
                    price: 3800,
                    sale: 24,
                    originalPrice: 5000,
                    imageName: "hogam",
                    info: "스파클링 와인\n370ml\n6%\n잘 익은 단감의 달콤함,\n상큼한 사과, 은은한 꿀맛"),
        Jeontongjoo(name: "벚꽃엔딩",
                    price: 11400,
                    sale: 19,
                    originalPrice: 14000,
                    imageName: "cherryBlossom",
                    info: "리큐르\n375ml\n15%\n달콤하고 부드러운 맛,\n상큼한 과일 맛"),
        Jeontongjoo(name: "소곡주",
                    price: 15750,
                    sale: 25,
                    originalPrice: 21000,
                    imageName: "sogok",
                    info: "약주\n700ml\n18%\n진하고 복합적인 맛,\n달콤함과 쓴 맛의 조화"),
        Jeontongjoo(name: "우곡생주 생막걸리",
                    price: 8100,
                    sale: 19,
                    originalPrice: 10000,
                    imageName: "woogoksang",
                    info: "약주\n700ml\n18%\n진하고 복합적인 맛,\n달콤함과 쓴 맛의 조화"),
        Jeontongjoo(name: "매실원주",
                    price: 5900,
                    sale: 26,
                    originalPrice: 8000,
                    imageName: "maesil",
                    info: "과실주\n375ml\n13%\n달콤한 매실, 산뜻한 여운,\n부드러운 목넘김"),
        Jeontongjoo(name: "사랑할때 (사과와인)",
                    price: 3800,
                    sale: 24,
                    originalPrice: 5000,
                    imageName: "atLove",
                    info: "과실주\n300ml\n12%\n사과의 자연스러운 단맛,\n상큼함, 부드러움")
        ]
}
