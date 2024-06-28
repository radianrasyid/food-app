//
//  NetworkManagerService.swift
//  SwiftUI-Appetizer
//
//  Created by Muhammad Radian Rasyid on 28/06/24.
//

import Foundation

final class NetworkManagerService{
    static let shared = NetworkManagerService()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    
    private init(){}
    
    func getAppetizers(completed: @escaping (Result<[AppetizerModel], AppetizerErrors>) -> Void){
        guard let url = URL(string: appetizerURL) else {completed(.failure(.invalidURL)); return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url), completionHandler: {
            data, response, error in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else{
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decodedResponse.request))
            }catch{
                completed(.failure(.invalidData))
            }
        })
        
        task.resume()
    }
}
