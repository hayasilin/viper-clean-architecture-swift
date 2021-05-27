//
//  ArticleViewModelMapping.swift
//  ViperDemo
//
//  Created by kuanwei on 2021/5/27.
//

import Foundation

protocol ArticleViewModelMapping {
    func viewModel(from article: Article) -> ArticleViewModel
}
