//
//  ArticlesInteractor.swift
//  ViperDemo
//
//  Created by kuanwei on 2021/5/24.
//

import Foundation

protocol ArticlesInteractorProtocol {
    func getArticles(_ completion: @escaping ([Article]?) -> Void)
}

struct ArticlesInteractor: ArticlesInteractorProtocol {
    let apiService: APIServiceProtocol

    init(apiService: APIServiceProtocol) {
        self.apiService = apiService
    }

    func getArticles(_ completion: @escaping ([Article]?) -> Void) {
        apiService.getArticles { articles, error in
            guard let articles = articles else {
                completion([])
                return
            }

            completion(articles)
        }
    }
}
