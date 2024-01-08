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

@MainActor
class ShopsStore: ObservableObject {
    @Published private(set) var shops = [Shop]()
 
    func loadShops() async {
        
        let url = URL(string: "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=\(Credentials.apiKey)&keyword=バーガー&lat=35.6581&lng=139.7017&format=json")!

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = [
            "Accept": "application/json"
        ]

        let (data, _) = try! await URLSession.shared.data(for: urlRequest)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try! decoder.decode(ShopResponse.self, from: data)
        shops = response.results.shop
    }
}

#Preview {
    MapView()
}
