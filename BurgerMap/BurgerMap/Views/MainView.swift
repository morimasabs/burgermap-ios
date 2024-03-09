//
//  MainView.swift
//  BurgerMap
//
//  Created by Masahito Mori on 2024/03/03.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            MapView()
                .tabItem {
                    VStack {
                        Image(systemName: "map.fill")
                        Text(R.string.localizable.map())
                    }
                }
            FavoriteShopsView()
                .tabItem {
                    VStack {
                        Image(systemName: "heart.fill")
                        Text(R.string.localizable.favorite())
                    }
                }
            ProfileView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.fill")
                        Text(R.string.localizable.profile())
                    }
                }
        }
    }
}

#Preview {
    MainView()
}
