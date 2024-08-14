//
//  SwiftUIView.swift
//  
//
//  Created by Tatiana Lazarenko on 8/14/24.
//

import SwiftUI

public struct TitleView: View {
    let title: String
    
    public init(title: String) {
        self.title = title
    }
    
    public var body: some View {
        Text(title)
            .font(.system(size: 12, weight: .light))
            .lineLimit(2)
            .multilineTextAlignment(.leading)
            .padding(.horizontal, 8)
    }
}
