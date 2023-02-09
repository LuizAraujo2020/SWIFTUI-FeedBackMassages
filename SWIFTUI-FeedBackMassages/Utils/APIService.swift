//
//  APIService.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 09/02/23.
//

import Foundation


final class APIService {
    
    static let shared = APIService()
    
    init () { }
    

    func loadData(url: String, completion:@escaping ([UserElement]) -> ()) {
        
        guard let url = URL(string: url) else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let books = try! JSONDecoder().decode([UserElement].self, from: data!)
            print(books)
            DispatchQueue.main.async {
                completion(books)
            }
        }.resume()
        
    }
    
}

/// Resource
/// https://shresthanabin.medium.com/using-generics-to-handle-get-and-post-requests-swift-3cd8a9285293
