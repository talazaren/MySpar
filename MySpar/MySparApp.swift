//
//  MySparApp.swift
//  MySpar
//
//  Created by Tatiana Lazarenko on 8/10/24.
//

import SwiftUI

@main
struct MySparApp: App {
    @State private var viewModel = ItemsViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environment(viewModel)
    }
}
