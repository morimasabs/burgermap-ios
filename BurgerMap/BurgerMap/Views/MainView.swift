//
//  MainView.swift
//  BurgerMap
//
//  Created by Masahito Mori on 2024/01/04.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            MapView()
                .tabItem {
                    VStack {
                        Image(systemName: "map.fill")
                        Text("地図")
                    }
                }
            FavoriteShopsView()
                .tabItem {
                    VStack {
                        Image(systemName: "heart.fill")
                        Text("お気に入り")
                    }
                }
        }
    }
}

#Preview {
    MainView()
}
