//
//  ShopAPIClient.swift
//  BurgerMap
//
//  Created by Masahito Mori on 2024/01/08.
//

import Foundation

struct ShopAPIClient {
    func getShops() async throws -> [Shop] {
       let url = URL(string: "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=\(Credentials.apiKey)&keyword=バーガー&lat=35.6581&lng=139.7017&format=json")!
        
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
