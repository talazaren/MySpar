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
