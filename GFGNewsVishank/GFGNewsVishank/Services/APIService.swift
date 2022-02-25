//
//  APIService.swift
//  GFGVishank

import Foundation
import SwiftUI

class APIService: ObservableObject {
    
    @StateObject static var shared = APIService()
    @Published var articles: [Item] = []
    
    private init() {}
    
    func getArticles() {
        guard let url = URL(string: AppConstants.baseUrl + AppConstants.apiUrl) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(ArticleAPIResponse.self, from: data)
                if let items = response.items {
                    DispatchQueue.main.async {
                        self?.articles = items
                        print(items)
                    }
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
