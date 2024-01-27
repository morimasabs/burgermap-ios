//
//  FailureView.swift
//  BurgerMap
//
//  Created by Masahito Mori on 2024/01/08.
//

import SwiftUI

struct FailureView: View {
    let action: () -> Void

    var body: some View {
        VStack {
            Text("通信に失敗しました")
                .font(.title2)
            Button(action: action) {
                Text("リトライ")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.8, green: 0.8, blue: 0.8, opacity: 0.7))
    }
}

#Preview {
    let action = {}
    return FailureView(action: action)
}
