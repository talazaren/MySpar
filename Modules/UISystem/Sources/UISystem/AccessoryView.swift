//
//  SwiftUIView.swift
//  
//
//  Created by Tatiana Lazarenko on 8/11/24.
//

import SwiftUI

public enum AccessoryType: String {
    case newItems = "Новинки"
    case hitPrices = "Удар по ценам"
    case priceByCard = "Цена по карте"
    
    public var color: Color {
        switch self {
        case .newItems:
            Color("AppPurple")
        case .hitPrices:
            Color("AppCoral")
        case .priceByCard:
            Color("AppGreen").opacity(0.6)
        }
    }
}

public struct AccessoryView: View {
    let itemAccessory: AccessoryType
    
    public init(itemAccessory: AccessoryType) {
        self.itemAccessory = itemAccessory
    }
    
    public var body: some View {
        Text(itemAccessory.rawValue)
            .font(.system(size: 10))
            .foregroundStyle(Color.white)
            .padding(.trailing, 6)
            .padding(.leading, 18)
            .padding(.bottom, 1)
            .frame(height: 16)
            .background(itemAccessory.color)
            .clipShape(RoundedRectangle(cornerRadius: 6))
    }
}

