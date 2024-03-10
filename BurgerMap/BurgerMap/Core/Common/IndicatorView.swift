//
//  IndicatorView.swift
//  BurgerMap
//
//  Created by Masahito Mori on 2024/01/08.
//

import SwiftUI

struct IndicatorView: View {
    var body: some View {
        ProgressView(R.string.localizable.loading())
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.8, green: 0.8, blue: 0.8, opacity: 0.7))
    }
}

#Preview {
    IndicatorView()
}
