//
//  ArticlesPresenter.swift
//  ViperDemo
//
//  Created by kuanwei on 2021/5/25.
//

import Foundation
import UIKit

protocol ArticlesPresenterProtocol {
    func showArticles(_ completion: @escaping (_ articles: [ArticleViewModel]) -> Void)
    func showArticleDetail(for viewModel: ArticleViewModel)
    func showCreatorScreen()
}

class ArticlesPresenter: ArticlesPresenterProtocol {

    let interactor: ArticlesInteractorProtocol
    let router: ArticlesRouterProtocol

    init(interactor: ArticlesInteractorProtocol, router: ArticlesRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }

    func showArticles(_ completion: @escaping (_ articles: [ArticleViewModel]) -> Void) {
        interactor.getArticles { articles in
            guard let articles = articles else {
                completion([])
                return
            }

            completion(self.createArticlesViewModels(from: articles))
        }
    }

    func showArticleDetail(for viewModel: ArticleViewModel) {
        router.showArticleDetail(for: viewModel)
    }

    func showCreatorScreen() {
        router.showCreatorScreen()
    }

    private func createArticlesViewModels(from articles: [Article]) -> [ArticleViewModel] {
        return articles.map { article in
            return ArticleViewModel(title: article.title, url: article.url)
        }
    }
}
