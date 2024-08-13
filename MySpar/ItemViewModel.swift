//
//  ItemViewModel.swift
//  MySpar
//
//  Created by Tatiana Lazarenko on 8/11/24.
//

import SwiftUI
import Observation

enum UnitType: String, CaseIterable, Identifiable {
    case kg = "Кг"
    case pcs = "Шт"
    
    var id: Self { self }
}

struct CartItem {
    var amount: Double = 0
    var selectedType: UnitType = .kg
}

@Observable
final class ItemsViewModel {
    var items: [Item] = []
    var cart: [UUID: CartItem] = [:]
    
    var favourites: [Item] = []
    var orderedItems: [Item] = []
    
    func getItemIncrement(for item: Item) -> Double {
        if let type = cart[item.id]?.selectedType {
            return type == .kg ? 0.1 : 1
        } else {
            return item.type == .kilograms ? 0.1 : 1
        }
    }
    
    func decreaseAmount(for item: Item) {
        let increment = getItemIncrement(for: item)
        addToCart(item: item, amount: -increment)
        
    }
    
    func increaseAmount(for item: Item) {
        if !isInCart(item: item) {
            cart[item.id] = CartItem()
        }
        let increment = getItemIncrement(for: item)
        addToCart(item: item, amount: increment)
    }
    
    func addToCart(item: Item, amount: Double) {
        cart[item.id]?.amount = (cart[item.id]?.amount ?? 0) + amount
        
        guard let amount = cart[item.id]?.amount else { return }
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
        cart[item.id]?.amount ?? 0
    }
    
    func getCostForItem(item: Item) -> Double {
        getAmountForItem(item: item) * item.cost
    }
    
    func getDisplayedAmount(for item: Item, amount: Double) {
        
    }
    
    func getSplitedStrings(of number: Double) -> [String] {
        let formattedNumber = String(format: "%.2f", number)
        let components = formattedNumber.split(separator: ".")
        
        return [String(components[0]), String(components[1])]
    }
    
    func addToFavourites(item: Item) {
        favourites.append(item)
    }
    
    func removeFromFavourites(item: Item) {
        if let index = favourites.firstIndex(of: item) {
            favourites.remove(at: index)
        }
    }
    
    func isFavourite(item: Item) -> Bool {
        return favourites.contains(item)
    }
    
    func getDiscountString(from item: Item) -> String {
        String(format: "%.0f", (item.discount ?? 0) * 100)
    }
}
