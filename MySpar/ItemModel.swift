//
//  ItemModel.swift
//  MySpar
//
//  Created by Tatiana Lazarenko on 8/11/24.
//

import Foundation
import UISystem

struct Item {
    let id = UUID()
    let title: String
    let cost: Double
    let oldCost: Double?
    let discount: Double?
    let image: String
    let accessory: AccessoryType
    let rating: Double
    let country: Country
    let type: AmountType
    
    var isOrdered: Bool
    var isFavorite: Bool
    var reviews: [String]
}

enum Country: String {
    case russia = "Россия 🇷🇺"
    case france = "Франция 🇫🇷"
    case italy = "Италия 🇮🇹"
}

enum AmountType {
    case pieces
    case kilograms
    case both
}
