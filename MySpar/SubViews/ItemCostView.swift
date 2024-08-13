//
//  ItemCostView.swift
//  MySpar
//
//  Created by Tatiana Lazarenko on 8/13/24.
//

import SwiftUI
import UISystem

struct ItemCostView: View {
    let item: Item
    var viewModel: ItemsViewModel
    
    @State private var selectedType: UnitType = .kg
    /*var selectedType: UnitType {
        get {
            viewModel.cart[item.id]?.selectedType ?? .kg
        }
        set {
            viewModel.cart[item.id]?.selectedType = newValue
        }
    }
    */
    
    var body: some View {
        VStack {
            switch viewModel.isInCart(item: item) {
            case true:
                Picker("UnitType", selection: $selectedType) {
                    ForEach(UnitType.allCases) { unit in
                        Text(unit.rawValue).tag(unit)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            default:
                EmptyView()
            }
            
            CartButtonView(
                isAdded: viewModel.isInCart(item: item),
                minusButtonAction: {
                    viewModel.decreaseAmount(for: item)
                },
                plusButtonAction: {
                    viewModel.increaseAmount(for: item)
                },
                amount: viewModel.getAmountForItem(item: item),
                cost: viewModel.getCostForItem(item: item),
                integerCost: viewModel.getSplitedStrings(of: item.cost)[0],
                fractionalCost: viewModel.getSplitedStrings(of: item.cost)[1],
                isDiscount: item.discount != nil,
                discountingCost: item.discountingCost
            )
            .padding(4)
        }
    }
}
