//
//  MapView.swift
//  BurgerMap
//
//  Created by Masahito Mori on 2024/01/04.
//

import SwiftUI
import MapKit

struct MapView: View {
    private let cameraPosition = MapCameraPosition.samplePosition
    @StateObject private var reposStore = ShopsStore()
    
    var body: some View {
        ZStack {
            Map(initialPosition: cameraPosition) {
                ForEach(reposStore.shops) { shop in
                    Annotation("", coordinate: shop.coordinate) {
                        Image("burger")
                    }
                    .annotationTitles(.hidden)
                }
            }
            if reposStore.shops.isEmpty {
                IndicatorView()
            }
        }
        .task {
            await reposStore.loadShops()
        }
    }
}

class ShopsStore: ObservableObject {
    @Published private(set) var shops = [Shop]()
 
    func loadShops() async {
        try! await Task.sleep(nanoseconds: 2_000_000_000)
        shops = [.mock1, .mock2, .mock3, .mock4, .mock5]
    }
}

#Preview {
    MapView()
}
