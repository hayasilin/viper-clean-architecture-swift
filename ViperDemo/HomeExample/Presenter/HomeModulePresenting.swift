//
//  HomeModulePresenting.swift
//  ViperDemo
//
//  Created by kuanwei on 2021/5/27.
//

import Foundation

protocol HomeModulePresenting {
    func onViewDidLoad()
    func onDidTapRefresh()
    func onDidSelectArticles(withIndex index: Int)
}
