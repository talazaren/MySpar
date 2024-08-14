//
//  ContentView.swift
//  MySpar
//
//  Created by Tatiana Lazarenko on 8/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ItemsView()
    }
}

#Preview {
    ContentView()
        .environment(ItemsViewModel())
}
