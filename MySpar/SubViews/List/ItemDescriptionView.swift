//
//  ItemDescriptionView.swift
//  MySpar
//
//  Created by Tatiana Lazarenko on 8/13/24.
//

import SwiftUI
import UISystem

struct ItemDescriptionView: View {
    @Binding var isGrid: Bool
    
    let item: Item
    var viewModel: ItemsViewModel
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    ReviewsView(
                        rating: item.rating,
                        review: viewModel.getReviewString(from: item),
                        isGrid: isGrid
                    )
                    
                    TitleView(title: item.title)
                    
                    if let country = item.country {
                        CountryView(country: country.rawValue)
                    }
                }
                Spacer()
                SaveButtonView(
                    isOrdered: false,
                    isFavorite: viewModel.isFavourite(item: item),
                    addToFavourites: {
                        viewModel.addToFavourites(item: item)
                    }, removeFromFavourites: {
                        viewModel.removeFromFavourites(item: item)
                    }
                )
            }
            Spacer()
            
            ItemCostView(item: item, viewModel: viewModel)
        }
        .frame(height: 144)
        .padding(.horizontal, 8)
        .padding(.vertical, 16)
    }
}

#Preview {
    ItemListView(isGrid: .constant(false), 
        item: Item(
        title: "сыр Ламбер 500/0 230г",
        cost: 99.90,
        discount: 0.25,
        image: "Item1",
        accessory: .hitPrices,
        scores: [3, 5, 4, 2],
        country: .russia,
        type: .pieces,
        reviews: nil
    ))
        .environment(ItemsViewModel())
}
