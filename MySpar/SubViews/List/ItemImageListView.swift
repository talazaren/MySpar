//
//  ItemImageListView.swift
//  MySpar
//
//  Created by Tatiana Lazarenko on 8/13/24.
//

import SwiftUI
import UISystem

struct ItemImageListView: View {
    let item: Item
    var viewModel: ItemsViewModel
    
    var body: some View {
        ZStack {
            Image(item.image)
                .resizable()
                .frame(width: 144, height: 144)
            
            if let accessory = item.accessory {
                let offset = accessory == .newItems ? 30 : 44
                
                AccessoryView(itemAccessory: accessory)
                    .position(x: CGFloat(offset), y: 8)
            }
            
            VStack {
                Spacer()
                
                HStack {
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
        .frame(width: 144, height: 144)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
