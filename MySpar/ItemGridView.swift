//
//  ItemGridView.swift
//  MySpar
//
//  Created by Tatiana Lazarenko on 8/12/24.
//

import SwiftUI
import UISystem

struct ItemGridView: View {
    @Environment(ItemsViewModel.self) private var viewModel
    let item: Item
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Image(item.image)
                    .resizable()
                    .frame(width: 168, height: 168)
                
                Text(item.title)
                    .font(.system(size: 12, weight: .light))
                    .frame(height: 14)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 8)
                
                Spacer()
                
                CostView(viewModel: viewModel, item: item)
            }
        }
        .frame(height: 278)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: Color("AppShadow"), radius: 8)
    }
}

struct CostView: View {
    var viewModel: ItemsViewModel
    let item: Item
    
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


#Preview {
    ItemGridView(item: Item(
        title: "сыр Ламбер 500/0 230г",
        cost: 99.90,
        discount: nil,
        image: "Item1",
        accessory: .hitPrices,
        scores: [3, 5, 4, 2],
        country: nil,
        type: .pieces,
        isOrdered: false,
        isFavorite: false,
        reviews: nil
    ))
        .environment(ItemsViewModel())
}
