//
//  ItemsView.swift
//  MySpar
//
//  Created by Tatiana Lazarenko on 8/13/24.
//

import SwiftUI
import UISystem

struct ItemsView: View {
    @State private var isGrid = true
    
    let items: [Item]
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    init() {
        self.items = ItemsMockData().items
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Rectangle()
                    .foregroundStyle(Color.white)
                    .frame(height: 44)
                
                HStack {
                    NavButtonView(isTapped: $isGrid)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 2)
                    Spacer()
                }
            }
            Divider()
            
            switch isGrid {
            case true:
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(items, id: \.self) { item in
                            ItemGridView(item: item)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 9)
                }
            default:
                List(items, id: \.self) { item in
                    ItemGridView(item: item)
                }
            }
            
            
            Spacer()
        }
        .edgesIgnoringSafeArea(.bottom)
        
    }
}

#Preview {
    ItemsView()
        .environment(ItemsViewModel())
}
