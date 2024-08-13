//
//  SwiftUIView.swift
//  
//
//  Created by Tatiana Lazarenko on 8/11/24.
//

import SwiftUI

public struct SaveButtonView: View {
    let isOrdered: Bool
    let addToFavourites: () -> Void
    let removeFromFavourites: () -> Void
    var isFavorite: Bool
    
    public init(
        isOrdered: Bool,
        isFavorite: Bool,
        addToFavourites: @escaping () -> Void,
        removeFromFavourites: @escaping () -> Void
    ) {
        self.isOrdered = isOrdered
        self.isFavorite = isFavorite
        self.addToFavourites = addToFavourites
        self.removeFromFavourites = removeFromFavourites
    }
    
    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .frame(width: 32, height: 64)
                .foregroundStyle(Color.white)
                .opacity(0.8)
            
            VStack {
                Image("saveIcon")
                    .renderingMode(.template)
                    .foregroundStyle(isOrdered ? Color("AppGreen") : Color.black.opacity(0.4))
                    .padding(4)
                
                Button(action: {
                    switch isFavorite {
                    case true:
                        removeFromFavourites()
                    default:
                        addToFavourites()
                    }
                }) {
                    Image(isFavorite ? "filledHeartIcon" : "heartIcon")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .padding(4)
                }
            }
        }
    }
}

