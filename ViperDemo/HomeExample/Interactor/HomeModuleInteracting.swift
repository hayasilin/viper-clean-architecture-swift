//
//  HomeModuleInteracting.swift
//  ViperDemo
//
//  Created by kuanwei on 2021/5/27.
//

import Foundation

protocol HomeModuleInteracting {
    func fetchArticleList(
        success: @escaping (_ articles: [Article]) -> Void,
        failure: @escaping (_ error: Error) -> Void
    )
}
