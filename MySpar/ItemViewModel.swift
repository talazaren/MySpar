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
final class ItemViewModel {
    var items: [Item]
    var cart: [UUID: Double] = [:]
    
    init(items: [Item]) {
        self.items = items
    }
    
    func addToCart(item: Item, amount: Double) {
        cart[item.id] = (cart[item.id] ?? 0) + amount
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
}
