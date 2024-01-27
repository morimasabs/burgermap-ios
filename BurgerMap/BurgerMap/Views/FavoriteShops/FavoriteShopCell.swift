//
//  FavoriteShopCell.swift
//  BurgerMap
//
//  Created by Masahito Mori on 2024/01/27.
//

import SwiftUI

struct FavoriteShopCell: View {
    let shop: Shop
    
    var body: some View {
        HStack {
            Image("burger")
            VStack(alignment: .leading) {
                Text(shop.name)
                Text(shop.address)
            }
        }
    }
}

#Preview {
    FavoriteShopCell(shop: .mock1)
}
