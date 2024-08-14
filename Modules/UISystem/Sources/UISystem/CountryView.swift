//
//  SwiftUIView.swift
//  
//
//  Created by Tatiana Lazarenko on 8/14/24.
//

import SwiftUI

public struct CountryView: View {
    let country: String
    
    public init(country: String) {
        self.country = country
    }
    
    public var body: some View {
        Text(country)
            .font(.system(size: 12, weight: .light))
            .foregroundStyle(Color.gray)
            .padding(.horizontal, 8)
            .padding(.top, 1)
    }
}

