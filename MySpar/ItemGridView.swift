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
    
    var body: some View {
        HStack {
            VStack {
                HStack(spacing: 4) {
                    Text(viewModel.getSplitedStrings(of: item.cost)[0])
                        .font(.system(size: 20, weight: .bold))
                        .frame(height: 22)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 8)
                    
                    Text(viewModel.getSplitedStrings(of: item.cost)[1])
                        .font(.system(size: 16, weight: .bold))
                        .frame(height: 22)
                        .multilineTextAlignment(.leading)
                    
                    Image("perAmountIcon")
                }
                
                if item.discount != nil {
                    Text(String(item.discountingCost))
                        .font(.system(size: 12, weight: .regular))
                        .foregroundStyle(Color.gray)
                        .frame(height: 14)
                        .multilineTextAlignment(.leading)
                }
            }
            Spacer()
            
            CartButtonView(
                isAdded: viewModel.isInCart(item: item),
                minusButtonAction: {
                    viewModel.decreaseAmount(for: item)
                },
                plusButtonAction: {
                    viewModel.increaseAmount(for: item)
                },
                amount: viewModel.getAmountForItem(item: item),
                cost: viewModel.getCostForItem(item: item)
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
