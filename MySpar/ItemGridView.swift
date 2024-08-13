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
                ItemImageView(item: item, viewModel: viewModel)
                
                Text(item.title)
                    .font(.system(size: 12, weight: .light))
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 8)
                
                Spacer()
                
                CostView(item: item, viewModel: viewModel)
            }
        }
        .frame(height: 278)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: Color("AppShadow"), radius: 8)
    }
}

struct ItemImageView: View {
    let item: Item
    var viewModel: ItemsViewModel
    
    var body: some View {
        ZStack {
            Image(item.image)
                .resizable()
                .frame(width: 168, height: 168)
            
            if let accessory = item.accessory {
                AccessoryView(itemAccessory: accessory)
                    .position(x: 44, y: 8)
            }
             
            HStack {
                VStack {
                    Spacer()
                    
                    HStack(spacing: 2) {
                        Image("star")
                            .padding(.leading, 4)
                        
                        Text(String(format: "%.1f", item.rating))
                            .font(.system(size: 12))
                    }
                    
                }
                
                Spacer()
                
                VStack {
                    SaveButtonView(
                        isOrdered: false,
                        isFavorite: viewModel.isFavourite(item: item),
                        addToFavourites: {
                            viewModel.addToFavourites(item: item)
                        }, removeFromFavourites: {
                            viewModel.removeFromFavourites(item: item)
                        }
                    )
                    
                    Spacer()
                    
                    if item.discount != nil {
                        Text(viewModel.getDiscountString(from: item) + "%")
                            .font(.system(size: 16, weight: .heavy))
                            .foregroundStyle(Color("AppRed"))
                            .padding(.horizontal, 5)
                    }
                }
            }
        }
        .frame(height: 168)
    }
}


struct CostView: View {
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


#Preview {
    ItemGridView(item: Item(
        title: "сыр Ламбер 500/0 230г",
        cost: 99.90,
        discount: 0.25,
        image: "Item1",
        accessory: .hitPrices,
        scores: [3, 5, 4, 2],
        country: nil,
        type: .pieces,
        reviews: nil
    ))
        .environment(ItemsViewModel())
}
