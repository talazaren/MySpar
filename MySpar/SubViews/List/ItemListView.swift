//
//  ItemListView.swift
//  MySpar
//
//  Created by Tatiana Lazarenko on 8/13/24.
//

import SwiftUI

struct ItemListView: View {
    @Environment(ItemsViewModel.self) private var viewModel
    @Binding var isGrid: Bool
    let item: Item
    
    var body: some View {
        HStack {
            ItemImageListView(item: item, viewModel: viewModel)
                
            ItemDescriptionView(isGrid: $isGrid, item: item, viewModel: viewModel)
        }
        .frame(height: 176)
        .background(Color.white)
    }
}

#Preview {
    ItemListView(isGrid: .constant(false), item: Item(
        title: "сыр Ламбер 500/0 230г",
        cost: 99.90,
        discount: 0.25,
        image: "Item1",
        accessory: .hitPrices,
        scores: [3, 5, 4, 2],
        country: nil,
        type: .both,
        reviews: nil
    ))
        .environment(ItemsViewModel())
}
