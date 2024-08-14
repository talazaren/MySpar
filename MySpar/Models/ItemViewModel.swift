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
    var amount: Decimal = 0
    var selectedType: UnitType
}

@Observable
final class ItemsViewModel {
    var items: [Item] = []
    var cart: [UUID: CartItem] = [:]
    
    var favourites: [Item] = []
    
    func updateType(for item: Item, unitType: UnitType) {
        switch unitType {
        case .kg:
            cart[item.id]?.selectedType = .kg
            cart[item.id]?.amount = 0.1
        case .pcs:
            cart[item.id]?.selectedType = .pcs
            cart[item.id]?.amount = 1
        }
    }
    
    func getItemIncrement(for item: Item) -> Decimal {
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
            switch item.type {
            case .pieces: cart[item.id] = CartItem(selectedType: .pcs)
            case .kilograms: cart[item.id] = CartItem(selectedType: .kg)
            case .both: cart[item.id] = CartItem(selectedType: .kg)
            }
        }
        let increment = getItemIncrement(for: item)
        addToCart(item: item, amount: increment)
    }
    
    func addToCart(item: Item, amount: Decimal) {
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
        
    func getAmountForItem(item: Item) -> Decimal {
        cart[item.id]?.amount ?? 0
    }
    
    func getCostForItem(item: Item) -> Double {
        let amountDouble = Double(truncating: getAmountForItem(item: item) as NSNumber)
        return amountDouble * item.cost
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
        favourites.contains(item)
    }
    
    func getDiscountString(from item: Item) -> String {
        String(format: "%.0f", (item.discount ?? 0) * 100)
    }
    
    func getReviewString(from item: Item) -> String {
        let form1 = "отзыв"
        let form2 = "отзыва"
        let form3 = "отзывов"
        
        let correctForm = getPluralForm(
            forNumber: item.reviews?.count ?? 0,
            form1: form1,
            form2: form2,
            form3: form3
        )
        
        return "\(item.reviews?.count ?? 0) \(correctForm)"
    }
    
    func getPluralForm(forNumber n: Int, form1: String, form2: String, form3: String) -> String {
        let mod10 = n % 10
        let mod100 = n % 100
        
        if mod10 == 1 && mod100 != 11 {
            return form1
        } else if mod10 >= 2 && mod10 <= 4 && (mod100 < 10 || mod100 >= 20) {
            return form2
        } else {
            return form3
        }
    }
}
