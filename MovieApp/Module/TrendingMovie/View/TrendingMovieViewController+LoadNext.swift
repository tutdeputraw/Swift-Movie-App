//
//  TrendingMovieViewController+LoadNext.swift
//  MovieApp
//
//  Created by tutdeputraw on 12/11/23.
//

import UIKit

extension TrendingMovieViewController {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height

        if maximumOffset - currentOffset <= 10.0 {
            viewModel.loadNextPage()
        }
    }
}
