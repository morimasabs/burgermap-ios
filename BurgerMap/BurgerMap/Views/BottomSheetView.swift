//
//  BottomSheetView.swift
//  BurgerMap
//
//  Created by Masahito Mori on 2024/01/21.
//

import SwiftUI

struct BottomSheetView: View {
    @Binding var shop: Shop
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("burger")
                Text(shop.name)
                    .font(.system(size: 24))
                    .fontWeight(.heavy)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Text("住所：\(shop.address)")
                .font(.system(size: 16))
                .fontWeight(.regular)
            Text("営業時間：\(shop.open)")
                .font(.system(size: 16))
                .fontWeight(.regular)
            Text("定休日：\(shop.close)")
                .font(.system(size: 16))
                .fontWeight(.regular)
        }
        .padding(.horizontal, 20)
        .padding(.top, 16)
        Spacer()
    }
}

#Preview {
    BottomSheetView(shop: .constant(.mock1))
}
