//
//  SwiftUIView.swift
//  
//
//  Created by Tatiana Lazarenko on 8/10/24.
//

import SwiftUI

public struct NavButtonView: View {
    @Binding var isTapped: Bool
    
    public init(isTapped: Binding<Bool>) {
        self._isTapped = isTapped
    }
    
    public var body: some View {
        Button(action: {
            withAnimation {
                isTapped.toggle()
            }
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .frame(width: 40, height: 40)
                    .foregroundStyle(Color("AppGray"))
                
                Image(isTapped ? "collectionIcon" : "listIcon")
            }
        }
        .contentTransition(.symbolEffect(.replace))
    }
}
