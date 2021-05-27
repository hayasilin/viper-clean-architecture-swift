//  HomeModuleRouter.swift
//  ViperDemo
//
//  Created by kuanwei on 2021/5/27.
//

import UIKit

final class HomeModuleRouter {
    weak var viewController: UIViewController?

}

extension HomeModuleRouter: HomeModuleRouting {
    func showDetails() {
        print("Show city details screen")
    }
}
