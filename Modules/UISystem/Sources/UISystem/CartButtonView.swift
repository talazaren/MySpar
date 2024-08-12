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
    
    @Binding var amount: String
    @Binding var cost: String
    @Binding var isAdded: Bool
    
    public init(
        isAdded: Binding<Bool>,
        minusButtonAction: @escaping () -> Void,
        plusButtonAction: @escaping () -> Void,
        amount: Binding<String>,
        cost: Binding<String>
    ) {
        self._isAdded = isAdded
        self.minusButtonAction = minusButtonAction
        self.plusButtonAction = plusButtonAction
        self._amount = amount
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
                        Text(amount)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(Color.white)
                        Text(cost)
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
            Button(action: {
                withAnimation {
                    isAdded.toggle()
                }
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 40)
                        .frame(width: 48, height: 36)
                        .foregroundStyle(Color("AppGreen"))
                    
                    Image("cartIcon")
                }
            }
            .contentTransition(.symbolEffect(.replace))
        }
    }
}

