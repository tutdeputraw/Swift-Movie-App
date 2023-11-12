//
//  SearchMovieViewModel+Search.swift
//  MovieApp
//
//  Created by tutdeputraw on 12/11/23.
//

import Foundation

extension SearchMovieViewModel {
    
    func updateSearchKeyword() {
        if getSearchedKeyword() == "" {
            appState.value = .none
            return
        }
        
        appState.value = .OnLoading
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(performSearch(_:)), userInfo: nil, repeats: false)
    }
    
    @objc private func performSearch(_ timer: Timer) {
        guard let searchKeyword = getSearchedKeyword() else {
            return
        }
        getMoviesBySearchKeyword(searchKeyword)
    }
    
    func getSearchedKeyword() -> String? {
        return searchController.searchBar.text
    }
}
