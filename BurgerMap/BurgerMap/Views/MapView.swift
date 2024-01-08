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
            
            switch reposStore.state {
            case .loading:
                IndicatorView()
            case .failed:
                FailureView {
                    Task {
                        await reposStore.loadShops()
                    }
                }
            case .loaded:
                EmptyView()
            }
        }
        .task {
            await reposStore.loadShops()
        }
    }
}

@MainActor
class ShopsStore: ObservableObject {
    @Published private(set) var state: Stateful = .loading
    @Published private(set) var shops = [Shop]()
    
    func loadShops() async {
        let url = URL(string: "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=\(Credentials.apiKey)&keyword=バーガー&lat=35.6581&lng=139.7017&format=json")!
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = [
            "Accept": "application/json"
        ]
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let value = try decoder.decode(ShopResponse.self, from: data)
            shops = value.results.shop
            state = .loaded
        } catch {
            state = .failed(error)
        }
    }
}

#Preview {
    MapView()
}
