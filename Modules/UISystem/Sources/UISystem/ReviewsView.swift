//
//  SwiftUIView.swift
//  
//
//  Created by Tatiana Lazarenko on 8/14/24.
//

import SwiftUI

public struct ReviewsView: View {
    let rating: Double
    let review: String
    var isGrid: Bool
    
    public init(rating: Double, review: String, isGrid: Bool) {
        self.rating = rating
        self.review = review
        self.isGrid = isGrid
    }
    
    public var body: some View {
        HStack(spacing: 2) {
            Image("star")
                .padding(.leading, 4)
            
            Text(String(format: "%.1f", rating))
                .font(.system(size: 12))
                .padding(.horizontal, 2)
            
            switch isGrid {
            case true:
                EmptyView()
            default:
                Rectangle()
                    .frame(width: 1, height: 16)
                    .foregroundStyle(Color.gray)
                
                Text(review)
                    .font(.system(size: 12))
                    .foregroundStyle(Color.gray)
                    .padding(.horizontal, 2)
            }
        }
    }
}

