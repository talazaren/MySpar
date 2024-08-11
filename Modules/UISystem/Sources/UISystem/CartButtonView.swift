//
//  SwiftUIView.swift
//  
//
//  Created by Tatiana Lazarenko on 8/11/24.
//

import SwiftUI

public struct CartButtonView: View {
    @Binding var isAdded: Bool
    
    public init(isAdded: Binding<Bool>) {
        self._isAdded = isAdded
    }
    
    public var body: some View {
        switch isAdded {
        case true:
            ZStack {
                RoundedRectangle(cornerRadius: 40)
                    .frame(height: 36)
                    .foregroundStyle(Color("AppGreen"))
                
                HStack {
                    Button(action: {
                        //viewModel action
                    }) {
                        Image("minusIcon")
                    }
                    .padding(.horizontal, 10)
                    
                    Spacer()
                    
                    VStack {
                        Text("200") //viewModel
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(Color.white)
                        Text("20") //viewModel
                            .font(.system(size: 12, weight: .regular))
                            .foregroundStyle(Color.white)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        //viewModel action
                    }) {
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

