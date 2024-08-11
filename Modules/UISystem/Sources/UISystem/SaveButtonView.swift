//
//  SwiftUIView.swift
//  
//
//  Created by Tatiana Lazarenko on 8/11/24.
//

import SwiftUI

public struct SaveButtonView: View {
    let isOrdered: Bool
    @Binding var isFavorite: Bool
    
    public init(isOrdered: Bool, isFavorite: Binding<Bool>) {
        self.isOrdered = isOrdered
        self._isFavorite = isFavorite
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
                    isFavorite.toggle()
                }) {
                    Image(isFavorite ? "heartIcon" : "filledHeartIcon")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .padding(4)
                }
            }
        }
    }
}

