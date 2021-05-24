//
//  ArticleResponse.swift
//  ViperDemo
//
//  Created by kuanwei on 2021/5/24.
//

import Foundation

struct ArticleResponse: Codable {
    let totalNumber: Int
    let list: [Article]

    private enum CodingKeys: String, CodingKey {
        case totalNumber = "totalNum"
        case list
    }
}

struct Article: Codable {
    let author: String
    let title: String
    let boardName: String
    let desc: String
    let url: String
    let imageList: [String]

    private enum CodingKeys: String, CodingKey {
        case author
        case title
        case boardName = "board_name"
        case desc
        case url
        case imageList = "img_list"
    }
}
