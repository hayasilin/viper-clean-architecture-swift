//
//  MainViewController.swift
//  ViperDemo
//
//  Created by kuanwei on 2021/5/24.
//

import UIKit

class MainViewController: UIViewController {

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
        return tableView
    }()

    var presenter: ArticlesPresenterProtocol?
    var viewModels: [ArticleViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "VIPER & Clean Architecture"
        let creatorBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(navigateToCreatorPage))
        navigationItem.rightBarButtonItem = creatorBarButtonItem


        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])

        binding()
    }

    private func binding() {
        presenter?.showArticles({ viewModels in
            self.viewModels = viewModels
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }

    @objc func navigateToCreatorPage(_ sender: UIBarButtonItem) {
        presenter?.showCreatorScreen()
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
        let viewModel = viewModels[indexPath.row]

        cell.textLabel?.text = viewModel.title

        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showArticleDetail(for: viewModels[indexPath.row])
    }
}
