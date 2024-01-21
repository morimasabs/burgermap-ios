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
        VStack {
            Text(shop.name)
            Text("name")
            Text("name")
        }
    }
}

#Preview {
    BottomSheetView(shop: .mock1)
}
