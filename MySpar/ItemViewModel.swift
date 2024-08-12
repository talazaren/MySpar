//
//  ItemViewModel.swift
//  MySpar
//
//  Created by Tatiana Lazarenko on 8/11/24.
//

import SwiftUI
import Observation

enum UnitType: String, CaseIterable {
    case kg = "Кг"
    case pcs = "Шт"
}

@Observable
final class ItemsViewModel {
    var items: [Item] = []
    var cart: [UUID: Double] = [:]
    
    func decreaseAmount(for item: Item) {
        let amount = getAmountForItem(item: item) - (item.type == .kilograms ? 0.1 : 1.0)
        if amount > 0 {
            addToCart(item: item, amount: -amount)
        } else {
            removeFromCart(item: item)
        }
    }
    
    func addToCart(item: Item, amount: Double) {
        cart[item.id] = (cart[item.id] ?? 0) + amount
        
        guard let amount = cart[item.id] else { return }
        if amount <= 0 {
            removeFromCart(item: item)
        }
        
    }
        
    func removeFromCart(item: Item) {
        cart[item.id] = nil
    }
        
    func isInCart(item: Item) -> Bool {
        cart[item.id] != nil
    }
        
    func getAmountForItem(item: Item) -> Double {
        cart[item.id] ?? 0
    }
    
    func getDisplayedAmount(for item: Item, amount: Double) {
        
    }
    
    func getSplitedStrings(of number: Double) -> [String] {
        let formattedNumber = String(format: "%.2f", number)
        let components = formattedNumber.split(separator: ".")
        
        return [String(components[0]), String(components[1])]
    }
}
