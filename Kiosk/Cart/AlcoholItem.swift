//
//  AlcoholItem.swift
//  Kiosk
//
//  Created by NH on 4/9/25.
//

protocol AlcoholItem {
    var name: String { get }
    var price: Int { get }
    var sale: Int { get }
    var originalPrice: Int { get }
    var imageName: String { get }
    var infoName: String { get }
    var info: String { get }
}
