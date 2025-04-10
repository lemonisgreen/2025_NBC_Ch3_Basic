//
//  CartDelegate.swift
//  Kiosk
//
//  Created by NH on 4/9/25.
//

import UIKit

protocol CartCollectionViewCellDelegate: AnyObject {
    func didTapPlusButton(in cell: CartCollectionViewCell)
    func didTapMinusButton(in cell: CartCollectionViewCell)
}
