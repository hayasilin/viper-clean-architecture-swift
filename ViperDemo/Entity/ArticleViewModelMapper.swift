//
//  ArticleViewModelMapper.swift
//  ViperDemo
//
//  Created by kuanwei on 2021/5/27.
//

import Foundation

struct ArticleViewModelMapper: ArticleViewModelMapping {
    func viewModel(from article: Article) -> ArticleViewModel {
        ArticleViewModel(
            title: article.title,
            url: article.url
        )
    }
}
