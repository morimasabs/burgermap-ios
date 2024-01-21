//
//  ShopAPIClient.swift
//  BurgerMap
//
//  Created by Masahito Mori on 2024/01/08.
//

import Foundation
import SwiftUI

struct ShopAPIClient {

    func getShops() async throws -> [Shop] {
        let coordinate = LocationManager.shared.currentCoordinate
        let url = URL(string: "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=\(Credentials.apiKey)&keyword=バーガー&lat=\(coordinate.latitude)&lng=\(coordinate.longitude)&format=json")!
        
       var urlRequest = URLRequest(url: url)
       urlRequest.httpMethod = "GET"
       urlRequest.allHTTPHeaderFields = [
           "Accept": "application/json"
       ]
        
       let (data, response) = try await URLSession.shared.data(for: urlRequest)
       guard let response = response as? HTTPURLResponse,
             response.statusCode == 200 else {
           throw URLError(.badServerResponse)
       }
        
       let decoder = JSONDecoder()
       decoder.keyDecodingStrategy = .convertFromSnakeCase
       let value = try decoder.decode(ShopResponse.self, from: data)
       return value.results.shop
   }
}
