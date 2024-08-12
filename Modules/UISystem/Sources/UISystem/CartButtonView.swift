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
    
    @Binding var cost: Double
    var amount: Double
    var isAdded: Bool
    
    public init(
        isAdded: Bool,
        minusButtonAction: @escaping () -> Void,
        plusButtonAction: @escaping () -> Void,
        amount: Double,
        cost: Binding<Double>
    ) {
        self.isAdded = isAdded
        self.minusButtonAction = minusButtonAction
        self.plusButtonAction = plusButtonAction
        self.amount = amount
        self._cost = cost
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
                        Text(String(cost))
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
            Button(action: plusButtonAction) {
                ZStack {
                    RoundedRectangle(cornerRadius: 40)
                        .frame(width: 48, height: 36)
                        .foregroundStyle(Color("AppGreen"))
                    
                    Image("cartIcon")
                }
            }
            //.contentTransition(.symbolEffect(.replace))
        }
    }
}

