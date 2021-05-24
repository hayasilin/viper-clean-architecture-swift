//
//  ArticlesRouter.swift
//  ViperDemo
//
//  Created by kuanwei on 2021/5/25.
//

import UIKit

protocol ArticlesRouterProtocol {
    func showArticleDetail(for viewModel: ArticleViewModel)
    func showCreatorScreen()
}

class ArticlesRouter: ArticlesRouterProtocol {
    let presentingViewController: UIViewController

    init(presentingViewController: UIViewController) {
        self.presentingViewController = presentingViewController
    }

    func showArticleDetail(for viewModel: ArticleViewModel) {
        guard let navigationController = presentingViewController.navigationController else {
            return
        }

        let articleDetailViewController = ArticleDetailViewController()
        articleDetailViewController.viewModel = viewModel

        navigationController.pushViewController(articleDetailViewController, animated: true)
    }

    func showCreatorScreen() {
        guard let navigationController = presentingViewController.navigationController else {
            return
        }

        let creatorViewController = CreatorViewController()

        navigationController.pushViewController(creatorViewController, animated: true)
    }
}
