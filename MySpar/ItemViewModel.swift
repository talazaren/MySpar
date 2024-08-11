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
    let unitCost: Double
    
    let incrementPiece = 1.0
    let incrementKilo = 0.1
    
    var totalAmount = 0.0
    var totalCost: Double {
        unitCost * totalAmount
    }
    
    init(unitCost: Double) {
        self.unitCost = unitCost
        //self.totalAmount =
    }
    
    /*func addIncrement(to value: Double, with increment: Double) {
        totalAmount += increment
        totalCost = value + totalAmount
    }*/
}
