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
    @StateObject private var viewModel = ShopViewModel()
    
    var body: some View {
        ZStack {
            Map(initialPosition: cameraPosition) {
                ForEach(viewModel.shops) { shop in
                    Annotation("", coordinate: shop.coordinate) {
                        Image("burger")
                    }
                    .annotationTitles(.hidden)
                }
            }
            
            switch viewModel.state {
            case .loading:
                IndicatorView()
            case .failed:
                FailureView {
                    Task {
                        await viewModel.onRetryButtonTapped()
                    }
                }
            case .loaded:
                EmptyView()
            }
        }
        .task {
            await viewModel.onAppear()
        }
    }
}

#Preview {
    MapView()
}
