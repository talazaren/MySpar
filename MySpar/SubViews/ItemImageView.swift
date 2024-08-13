//
//  ItemImageView.swift
//  MySpar
//
//  Created by Tatiana Lazarenko on 8/13/24.
//

import SwiftUI
import UISystem

struct ItemImageView: View {
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

