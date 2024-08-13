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
    
    var body: some View {
        VStack(spacing: 0) {
            switch viewModel.isInCart(item: item) && item.type == .both {
            case true:
                Picker("UnitType", selection: $selectedType) {
                    ForEach(UnitType.allCases) { unit in
                        Text(unit.rawValue).tag(unit)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal, 4)
                .onChange(of: selectedType) { _, newValue in
                    viewModel.updateType(for: item, unitType: newValue)
                }
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

#Preview {
    ItemsView()
        .environment(ItemsViewModel())
}
