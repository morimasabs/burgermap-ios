//
//  MainView.swift
//  BurgerMap
//
//  Created by Masahito Mori on 2024/01/04.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if viewModel.userSession != nil {
            MainView()
        } else {
            SignInView()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthViewModel())
}
