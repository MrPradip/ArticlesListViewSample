//
//  ArticlesViewModal.swift
//  ArticlesListViewSample
//
//  Created by Pradip Kumar on 04/03/25.
//

import Foundation

class ArticleViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let apiURL = 
    //"https://newsapp.org/v2/everything?q=tesla&from=2025-02-04&sortBy=publishedAt&apiKey=YOUR_API_KEY"
    "https://newsapp.org/v2/everything?q=tesla&from=2025-02-04&sortBy=publishedAt&apiKey=b0ad12098b4f455881416f924788f004"
    //API key = b0ad12098b4f455881416f924788f004 // dummy key

    // MARK : Data uploaded from API by adding correct API key
    func fetchArticles() {
        guard let url = URL(string: apiURL) else {
            self.errorMessage = "Invalid API URL"
            return
        }

        isLoading = true
        errorMessage = nil

        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            DispatchQueue.main.async {
                self?.isLoading = false

                if let error = error {
                    self?.errorMessage = "Error fetching data: \(error.localizedDescription)"
                    return
                }

                guard let data = data else {
                    self?.errorMessage = "No data received"
                    return
                }
                
                // DEBUG: Print raw JSON response
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("🔹 Raw JSON Response: \(jsonString)")
                }

                do {
                    let decodedResponse = try JSONDecoder().decode(ArticleResponse.self, from: data)
                    self?.articles = decodedResponse.articles
                } catch {
                    self?.errorMessage = "Failed to decode data: \(error.localizedDescription)"
                }
            }
        }
        
        task.resume()
    }
    // MARK : Data uploaded from Local JSON File as API key is not there
    @objc func fetchArticlesFromLocalJSON() {
            isLoading = true
            errorMessage = nil
        
        if let path = Bundle.main.path(forResource: "Articles", ofType: "json") {
               print("Found JSON file at path: \(path)")
               do {
                   let data = try Data(contentsOf: URL(fileURLWithPath: path))
                   let decodedResponse = try JSONDecoder().decode(ArticleResponse.self, from: data)
                   DispatchQueue.main.async {
                       self.articles = decodedResponse.articles
                       self.isLoading = false
                       print(" Successfully decoded JSON: \(self.articles)")
                   }
               } catch {
                   DispatchQueue.main.async {
                       self.errorMessage = "Failed to decode local JSON: \(error.localizedDescription)"
                       self.isLoading = false
                       print(" Error decoding JSON: \(error)")
                   }
               }
           } else {
               print(" Local JSON file not found!")
               errorMessage = "Local JSON file not found"
               isLoading = false
           }
        }
}
