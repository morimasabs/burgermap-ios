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
            Image("BurgerIcon")
            VStack(alignment: .leading) {
                Text(shop.name)
                    .font(.system(size: 20))
                Text(shop.address)
                    .font(.system(size: 16))
            }
        }
    }
}

#Preview {
    FavoriteShopCell(shop: .mock1)
}
