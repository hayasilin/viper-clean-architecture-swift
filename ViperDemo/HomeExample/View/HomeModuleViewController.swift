//
//  HomeModuleViewController.swift
//  ViperDemo
//
//  Created by kuanwei on 2021/5/27.
//
 
import UIKit

final class HomeModuleViewController: UIViewController {
    private enum Constants {
        static let cellIdentifier = "homeCellIdentifier"
    }

    private let presenter: HomeModulePresenting

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    private var articles: [ArticleViewModel] = []

    init(presenter: HomeModulePresenting) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.onViewDidLoad()

        let actionBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(refreshButtonTapped))
        navigationItem.rightBarButtonItem = actionBarButtonItem

        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension HomeModuleViewController: HomeModuleView {
    func update(articles: [ArticleViewModel]) {
        self.articles = articles
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func showError() {}
}

extension HomeModuleViewController {
    @objc private func refreshButtonTapped() {
        presenter.onDidTapRefresh()
    }
}

extension HomeModuleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        if let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier) {
            cell = dequeuedCell
            cell.textLabel?.text = articles[indexPath.row].title
        } else {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: Constants.cellIdentifier)
            cell.textLabel?.text = articles[indexPath.row].title
            cell.detailTextLabel?.text = "test"
        }

        return cell
    }
}

extension HomeModuleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.onDidSelectArticles(withIndex: indexPath.row)
    }
}
