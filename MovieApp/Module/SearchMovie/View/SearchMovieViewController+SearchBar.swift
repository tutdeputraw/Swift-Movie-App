//
//  SearchMovieViewController+SearchBar.swift
//  MovieApp
//
//  Created by tutdeputraw on 12/11/23.
//

import Foundation
import UIKit

extension SearchMovieViewController: UISearchResultsUpdating {
    
    func setupSearchBar() {
        viewModel.searchController.searchResultsUpdater = self
        navigationItem.searchController = viewModel.searchController
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        viewModel.updateSearchKeyword()
    }
}
