//
//  APIService.swift
//  ViperDemo
//
//  Created by kuanwei on 2021/5/25.
//

import Foundation

protocol APIServiceProtocol {
    func getArticles(_ completion: @escaping (_ articles: [Article]?, _ error: Error?) -> Void)
}

struct APIService: APIServiceProtocol {

    let url = URL(string: "https://disp.cc/api/hot_text.json")!

    func getArticles(_ completion: @escaping (_ articles: [Article]?, _ error: Error?) -> Void) {

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "")
                return
            }

            do {
                let articles = try JSONDecoder().decode(ArticleResponse.self, from: data)
                completion(articles.list, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
}
