//
//  FavoriteShopsView.swift
//  BurgerMap
//
//  Created by Masahito Mori on 2024/01/27.
//

import SwiftUI

struct FavoriteShopsView: View {
    var shops: [Shop] = [.mock1, .mock2, .mock3, .mock4, .mock5]
    
    var body: some View {
        NavigationStack {
            List(shops) { shop in
                FavoriteShopCell(shop: shop)
            }
            .listStyle(.plain)
            .navigationTitle("お気に入り")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    FavoriteShopsView()
}
