//
//  TrendingMovieViewController.swift
//  MovieApp
//
//  Created by tutdeputraw on 17/11/23.
//

import UIKit

class TrendingMovieViewControllerProgramatically: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .brown
        tableView.rowHeight = 150
        return tableView
    }()
    private let loadingIndicator: UIActivityIndicatorView = {
        let loadingIndicator = UIActivityIndicatorView(style: .large)
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        return loadingIndicator
    }()
    
    let viewModel: TrendingMovieViewModel = TrendingMovieViewModel()
    let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupViewConstraint()
    }
    
    func setupView() {
        navigationController?.navigationBar.topItem?.title = "Trending Movies"
        self.view.backgroundColor = .white
        
        view.addSubview(tableView)
        setupTableView()
        
        view.addSubview(loadingIndicator)
        setupPullToRefresh()
    }
    
    func setupViewConstraint() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.firstLoad()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func bindViewModel() {
        viewModel.appState.bind { result in
            DispatchQueue.main.async {
                switch result {
                case .OnSuccess:
                    self.reloadTableView()
                    self.loadingIndicator.stopAnimating()
                    self.refreshControl.endRefreshing()
                    self.tableView.isHidden = false
                case .OnLoading:
                    self.loadingIndicator.startAnimating()
                    self.tableView.isHidden = true
                case .OnError(message: _):
                    self.loadingIndicator.stopAnimating()
                    self.refreshControl.endRefreshing()
                case .none:
                    return
                }
            }
        }
    }
}

// MARK: tableVIew
extension TrendingMovieViewControllerProgramatically: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(MovieCell.self, forCellReuseIdentifier: MovieCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.identifier, for: indexPath) as? MovieCell else {
            return UITableViewCell()
        }
        
        let data = viewModel.dataSource?.results[indexPath.row]
    
        cell.bindData(data!)
        
        return cell
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = viewModel.dataSource?.results[indexPath.row]
        let destinationVC = TrendingMovieDetailViewController(data!)
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSource?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

// MARK: pullToRefresh
extension TrendingMovieViewControllerProgramatically {
    
    func setupPullToRefresh() {
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    @objc func refresh(_ sender: Any) {
        viewModel.refreshPage()
        bindViewModel()
    }
}

