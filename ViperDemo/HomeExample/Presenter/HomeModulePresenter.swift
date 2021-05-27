//
//  HomeModulePresenter.swift
//  ViperDemo
//
//  Created by kuanwei on 2021/5/27.
//

import Foundation

final class HomeModulePresenter {
    weak var view: HomeModuleView?
    private let interactor: HomeModuleInteracting
    private let router: HomeModuleRouting
    private let mapper: ArticleViewModelMapping

    init(
        interactor: HomeModuleInteracting,
        router: HomeModuleRouting,
        mapper: ArticleViewModelMapping
    ) {
        self.interactor = interactor
        self.router = router
        self.mapper = mapper
    }
}

extension HomeModulePresenter: HomeModulePresenting {
    func onViewDidLoad() {}

    func onDidTapRefresh() {
        interactor.fetchArticleList(
            success: { [weak view] articles in
                let articleViewModels = articles.map {
                    self.mapper.viewModel(from: $0)
                }
                view?.update(articles: articleViewModels)
            },
            failure: { [weak view] _ in
                view?.showError()
            }
        )
    }

    func onDidSelectArticles(withIndex index: Int) {
        router.showDetails()
    }
}
