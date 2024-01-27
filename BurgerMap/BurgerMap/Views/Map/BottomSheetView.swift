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
                    .font(.system(size: 20))
                    .fontWeight(.heavy)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            SectionView(title: "住所")
            InSectionView(description: shop.address)
            SectionView(title: "営業時間")
            InSectionView(description: shop.open)
            SectionView(title: "定休日")
            InSectionView(description: shop.close)
        }
        .padding(.horizontal, 20)
        .padding(.top, 16)
        Spacer()
    }
    
    struct SectionView: View {
        let title: String
        var body: some View {
            Text(title)
                .font(.system(size: 20))
                .fontWeight(.bold)
                .padding(.leading, 4)
                .padding(.bottom, 4)
        }
    }
    
    struct InSectionView: View {
        let description: String
        var body: some View {
            Text(description)
                .font(.system(size: 16))
                .fontWeight(.regular)
                .padding(.leading, 4)
                .padding(.bottom, 4)
        }
    }
}

#Preview {
    BottomSheetView(shop: .constant(.mock1))
}
