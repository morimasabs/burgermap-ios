//
//  MainView.swift
//  BurgerMap
//
//  Created by Masahito Mori on 2024/01/04.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if viewModel.userSession != nil {
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
                ProfileView()
                    .tabItem {
                        VStack {
                            Image(systemName: "person.fill")
                            Text("プロフィール")
                        }
                    }
            }
        } else {
            SignInView()
        }
    }
}

#Preview {
    MainView()
        .environmentObject(AuthViewModel())
}
