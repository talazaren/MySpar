//
//  ItemDescriptionView.swift
//  MySpar
//
//  Created by Tatiana Lazarenko on 8/13/24.
//

import SwiftUI
import UISystem

struct ItemDescriptionView: View {
    let item: Item
    var viewModel: ItemsViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 2) {
                Image("star")
                    .padding(.leading, 4)
                
                Text(String(format: "%.1f", item.rating))
                    .font(.system(size: 12))
                    .padding(.horizontal, 2)
                
                Rectangle()
                    .frame(width: 1, height: 16)
                    .foregroundStyle(Color.gray)
                
                Text(viewModel.getReviewString(from: item))
                    .font(.system(size: 12))
                    .foregroundStyle(Color.gray)
                    .padding(.horizontal, 2)
            }
            
            Text(item.title)
                .font(.system(size: 12, weight: .light))
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 8)
            
            if let country = item.country {
                Text(country.rawValue)
                    .font(.system(size: 12, weight: .light))
                    .foregroundStyle(Color.gray)
                    .padding(.horizontal, 8)
                    .padding(.top, 1)
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
    ItemListView(item: Item(
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
