//
//  ArticlesPresenterTests.swift
//  ViperDemoTests
//
//  Created by kuanwei on 2021/5/25.
//

import XCTest
@testable import ViperDemo

class ArticlesPresenterTests: XCTestCase {
    var presenter: ArticlesPresenterProtocol!
    var interactor: TestArticlesInteractor!
    var router: TestArticlesRouter!

    override func setUp() {
        super.setUp()

        interactor = TestArticlesInteractor()
        router = TestArticlesRouter()
        presenter = ArticlesPresenter(interactor: interactor, router: router)
    }

    func testThatItRetrievesCars() {
        let testExpectation = expectation(description: #function)

        let article = Article(author: "author", title: "title", boardName: "boardName", desc: "desc", url: "url", imageList: ["imageList"])
        interactor.articles = [article]

        let callback = { (_ articles: [ArticleViewModel]?) -> Void in
            XCTAssertEqual(articles?.count, 1)
            XCTAssertEqual(articles?.first?.title, "title")
            XCTAssertEqual(articles?.first?.url, "url")
            testExpectation.fulfill()
        }

        presenter.showArticles(callback)

        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testThatItShowsCarDetailScreen() {
        presenter.showArticleDetail(for: ArticleViewModel(title: "title", url: "url"))
        XCTAssertTrue(router.showArticleDetailCalled)
    }

    func testThatItShowsCreateCarScreen() {
        presenter.showCreatorScreen()
        XCTAssertTrue(router.showCreatorScreenCalled)
    }
}

// Test Classes
extension ArticlesPresenterTests {
    class TestArticlesRouter: ArticlesRouterProtocol {
        var showArticleDetailCalled = false
        var showCreatorScreenCalled = false

        func showArticleDetail(for viewModel: ArticleViewModel) {
            showArticleDetailCalled = true
        }

        func showCreatorScreen() {
            showCreatorScreenCalled = true
        }
    }

    class TestArticlesInteractor: ArticlesInteractorProtocol {
        var articles: [Article]?

        func getArticles(_ completion: @escaping ([Article]?) -> Void) {
            completion(articles)
        }
    }
}
