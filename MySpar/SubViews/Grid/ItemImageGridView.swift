//
//  ItemImageView.swift
//  MySpar
//
//  Created by Tatiana Lazarenko on 8/13/24.
//

import SwiftUI
import UISystem

struct ItemImageGridView: View {
    @Binding var isGrid: Bool
    
    let item: Item
    var viewModel: ItemsViewModel
    
    var body: some View {
        ZStack {
            Image(item.image)
                .resizable()
                .frame(width: 168, height: 168)
            
            if let accessory = item.accessory {
                let offset = accessory == .newItems ? 30 : 44
                
                AccessoryView(itemAccessory: accessory)
                    .position(x: CGFloat(offset), y: 8)
            }
             
            HStack {
                VStack {
                    Spacer()
                    
                    ReviewsView(
                        rating: item.rating,
                        review: viewModel.getReviewString(from: item),
                        isGrid: isGrid
                    )
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

#Preview {
    ItemGridView(isGrid: .constant(true), item: Item(
        title: "сыр Ламбер 500/0 230г",
        cost: 99.90,
        discount: 0.25,
        image: "Item1",
        accessory: .hitPrices,
        scores: [3, 5, 4, 2],
        country: .france,
        type: .pieces,
        reviews: nil
    ))
        .environment(ItemsViewModel())
}

