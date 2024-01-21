//
//  ContentView.swift
//  BurgerMap
//
//  Created by Masahito Mori on 2024/01/04.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let _ = LocationManager.shared
        MapView()
    }
}

#Preview {
    ContentView()
}
