//
//  ItemModel.swift
//  MySpar
//
//  Created by Tatiana Lazarenko on 8/11/24.
//

import Foundation
import UISystem

struct Item: Hashable {
    let id = UUID()
    let title: String
    let cost: Double
    let discount: Double?
    let image: String
    let accessory: AccessoryType?
    let scores: [Int]
    let country: Country?
    let type: AmountType
    var reviews: [String]?
    
    var rating: Double {
        Double(scores.reduce(0, +)) / Double(scores.count)
    }
    
    var discountingCost: Double {
        if let discount {
            return cost * (1 + discount)
        } else { return cost }
    }
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
