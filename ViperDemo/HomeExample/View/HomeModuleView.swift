//
//  HomeModuleView.swift
//  ViperDemo
//
//  Created by kuanwei on 2021/5/27.
//

import Foundation

protocol HomeModuleView: AnyObject {
    func update(articles: [ArticleViewModel])
    func showError()
}
