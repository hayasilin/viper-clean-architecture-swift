//
//  HomeModuleInteractor.swift
//  ViperDemo
//
//  Created by kuanwei on 2021/5/27.
//

import Foundation

final class HomeModuleInteractor {
    let apiService: APIServiceProtocol

    init(
        apiService: APIServiceProtocol
    ) {
        self.apiService = apiService
    }
}

extension HomeModuleInteractor: HomeModuleInteracting {
    func fetchArticleList(
        success: @escaping (_ articles: [Article]) -> Void,
        failure: @escaping (_ error: Error) -> Void
    ) {
        apiService.getArticles { articles, error in
            guard let articles = articles else {
                if let error = error {
                    failure(error)
                }
                return
            }

            success(articles)
        }
    }
}
