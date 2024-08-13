//
//  SwiftUIView.swift
//  
//
//  Created by Tatiana Lazarenko on 8/11/24.
//

import SwiftUI

public struct CartButtonView: View {
    let minusButtonAction: () -> Void
    let plusButtonAction: () -> Void
    
    let integerCost: String
    let fractionalCost: String
    let isDiscount: Bool
    let discountingCost: Double
    
    var cost: Double
    var amount: Double
    var isAdded: Bool
    
    public init(
        isAdded: Bool,
        minusButtonAction: @escaping () -> Void,
        plusButtonAction: @escaping () -> Void,
        amount: Double,
        cost: Double,
        integerCost: String,
        fractionalCost: String,
        isDiscount: Bool,
        discountingCost: Double
    ) {
        self.isAdded = isAdded
        self.minusButtonAction = minusButtonAction
        self.plusButtonAction = plusButtonAction
        self.amount = amount
        self.cost = cost
        self.integerCost = integerCost
        self.fractionalCost = fractionalCost
        self.isDiscount = isDiscount
        self.discountingCost = discountingCost
    }
    
    public var body: some View {
        switch isAdded {
        case true:
            ZStack {
                RoundedRectangle(cornerRadius: 40)
                    .frame(height: 36)
                    .foregroundStyle(Color("AppGreen"))
                
                HStack {
                    Button(action: minusButtonAction) {
                        Image("minusIcon")
                    }
                    .padding(.horizontal, 10)
                    
                    Spacer()
                    
                    VStack {
                        Text(String(amount))
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(Color.white)
                        Text("~" + String(format: "%.2f", cost) + " ₽")
                            .font(.system(size: 12, weight: .regular))
                            .foregroundStyle(Color.white)
                    }
                    
                    Spacer()
                    
                    Button(action: plusButtonAction) {
                        Image("plusIcon")
                    }
                    .padding(.horizontal, 10)
                }
            }
        default:
            HStack {
                VStack {
                    HStack(spacing: 4) {
                        Text(integerCost)
                            .font(.system(size: 20, weight: .bold))
                            .frame(height: 22)
                            .multilineTextAlignment(.leading)
                            .padding(.leading, 8)
                        
                        Text(fractionalCost)
                            .font(.system(size: 16, weight: .bold))
                            .frame(height: 22)
                            .multilineTextAlignment(.leading)
                        
                        Image("perAmountIcon")
                    }
                    
                    if isDiscount {
                        Text(String(discountingCost))
                            .font(.system(size: 12, weight: .regular))
                            .foregroundStyle(Color.gray)
                            .frame(height: 14)
                            .multilineTextAlignment(.leading)
                    }
                }
                Spacer()
                
                Button(action: plusButtonAction) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 40)
                            .frame(width: 48, height: 36)
                            .foregroundStyle(Color("AppGreen"))
                        
                        Image("cartIcon")
                    }
                }
            }
        }
    }
}


