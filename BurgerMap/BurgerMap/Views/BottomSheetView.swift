//
//  BottomSheetView.swift
//  BurgerMap
//
//  Created by Masahito Mori on 2024/01/21.
//

import SwiftUI

struct BottomSheetView: View {
    let shop: Shop
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("burger")
                Text(shop.name)
                    .font(.system(size: 28))
                    .fontWeight(.heavy)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Text("住所：hogehoge")
                .font(.system(size: 20))
                .fontWeight(.bold)
        }
        .padding(.horizontal, 20)
        .padding(.top, 16)
        Spacer()
    }
}

#Preview {
    BottomSheetView(shop: .mock1)
}
