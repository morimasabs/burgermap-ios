//
//  SettingRowView.swift
//  BurgerMap
//
//  Created by Masahito Mori on 2024/03/03.
//

import SwiftUI

struct SettingRowView: View {
    let imageName: String
    let title: String
    let tintColor: Color
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .foregroundStyle(tintColor)
            
            Text(title)
                .font(.subheadline)
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    SettingRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
}
