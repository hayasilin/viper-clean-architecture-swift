//
//  HomeModuleBuilder.swift
//  ViperDemo
//
//  Created by kuanwei on 2021/5/27.
//

import UIKit

final class HomeModuleBuilder: HomeModuleBuilding {
    func view() -> UIViewController {
        let apiService = APIService()

        let router = HomeModuleRouter()

        let interactor = HomeModuleInteractor(
            apiService: apiService
        )

        let presenter = HomeModulePresenter(
            interactor: interactor,
            router: router,
            mapper: ArticleViewModelMapper()
        )

        let view = HomeModuleViewController(presenter: presenter)

        presenter.view = view
        router.viewController = view

        return view
    }
}
