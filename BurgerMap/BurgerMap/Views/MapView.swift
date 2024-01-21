//
//  MapView.swift
//  BurgerMap
//
//  Created by Masahito Mori on 2024/01/04.
//

import SwiftUI
import MapKit

struct MapView: View {
    @StateObject private var viewModel = ShopViewModel()
    @StateObject private var locationManager = LocationManager.shared
    @State private var showBottomSheet = false
    @State private var selectedShop: Shop = .mock1
    
    var body: some View {
        ZStack {
            Map(position: $locationManager.cameraPosition) {
                if locationManager.authorizationStatus == .authorizedAlways || locationManager.authorizationStatus == .authorizedWhenInUse {
                    UserAnnotation()
                }
                ForEach(viewModel.shops) { shop in
                    Annotation("", coordinate: shop.coordinate) {
                        Image("burger")
                            .onTapGesture {
                                selectedShop = shop
                                showBottomSheet = true
                            }
                    }
                    .annotationTitles(.hidden)
                }
            }.sheet(isPresented: $showBottomSheet, content: {
                BottomSheetView(shop: $selectedShop)
                    .presentationDetents([.medium, .large])
                    .presentationDragIndicator(.visible)
            })
            
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
        .onChange(of: locationManager.authorizationStatus) {
            Task {
                await viewModel.onChange()
            }
        }
    }
}

#Preview {
    MapView()
}
