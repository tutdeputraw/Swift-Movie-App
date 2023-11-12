//
//  SearchMovieViewController.swift
//  MovieApp
//
//  Created by tutdeputraw on 11/11/23.
//

import UIKit

class SearchMovieViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    let refreshControl = UIRefreshControl()
    
    let viewModel = SearchMovieViewModel()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "search"
        setupSearchBar()
        setupPullToRefresh()
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        bindViewModel()
    }
    
    func bindViewModel() {
        viewModel.appState.bind { result in
            DispatchQueue.main.async {
                switch result {
                case .OnSuccess:
                    self.reloadTableView()
                    self.loadingIndicator.stopAnimating()
                    self.refreshControl.endRefreshing()
                case .OnLoading:
                    self.loadingIndicator.startAnimating()
                case .OnError(message: _):
                    self.loadingIndicator.stopAnimating()
                    self.refreshControl.endRefreshing()
                case .none:
                    self.loadingIndicator.stopAnimating()
                    return
                }
            }
        }
    }
}
