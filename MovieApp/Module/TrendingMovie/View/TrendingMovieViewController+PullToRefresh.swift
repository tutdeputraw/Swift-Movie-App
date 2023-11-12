//
//  TrendingMovieViewController+PullToRefresh.swift
//  MovieApp
//
//  Created by tutdeputraw on 11/11/23.
//

import Foundation

extension TrendingMovieViewController {
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
