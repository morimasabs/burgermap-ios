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
    @State private(set) var shops = [Shop]()
    
    var body: some View {
        Map(initialPosition: cameraPosition) {
            ForEach(shops) { shop in
                Annotation("", coordinate: shop.coordinate) {
                    Image("burger")
                }
                .annotationTitles(.hidden)
            }
        }
        .task {
            await loadRepos()
        }
    }
    
    private func loadRepos() async {
        try! await Task.sleep(nanoseconds: 2_000_000_000)
        shops = [.mock1, .mock2, .mock3, .mock4, .mock5]
    }
}

#Preview {
    MapView()
}
