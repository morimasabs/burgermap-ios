//
//  ShopViewModel.swift
//  BurgerMap
//
//  Created by Masahito Mori on 2024/01/08.
//

import Foundation

@MainActor
class ShopViewModel: ObservableObject {
    @Published private(set) var state: Stateful = .loading
    @Published private(set) var shops = [Shop]()
    
    func onAppear() async {
        await loadShops()
    }
    
    func onChange() async {
        await loadShops()
    }
    
    func onRetryButtonTapped() async {
        await loadShops()
    }
    
    func loadShops() async {
        state = .loading
        
        do {
            shops = try await ShopAPIClient().getShops()
            state = .loaded
        } catch {
            state = .failed(error)
        }
    }
}
