//
//  TrendingMovieViewController.swift
//  MovieApp
//
//  Created by tutdeputraw on 11/11/23.
//

import UIKit

class TrendingMovieViewController: UIViewController {

    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    let refreshControl = UIRefreshControl()
    
    let viewModel: TrendingMovieViewModel = TrendingMovieViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.title = "Trending Movies"
        setupTableView()
        setupPullToRefresh()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.refreshPage()
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
                    return
                }
            }
        }
    }
}
