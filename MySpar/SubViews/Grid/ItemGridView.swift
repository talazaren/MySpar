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
    @Binding var isGrid: Bool
    let item: Item
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                ItemImageGridView(isGrid: $isGrid, item: item, viewModel: viewModel)
                
                TitleView(title: item.title)
                
                if let country = item.country {
                    CountryView(country: country.rawValue)
                }
                
                Spacer()
                
                ItemCostView(item: item, viewModel: viewModel)
            }
        }
        .frame(height: 278)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: Color("AppShadow"), radius: 8)
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
