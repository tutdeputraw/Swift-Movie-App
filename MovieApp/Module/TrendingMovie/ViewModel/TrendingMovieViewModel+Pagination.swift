//
//  TrendingMovieViewModel+Pagination.swift
//  MovieApp
//
//  Created by tutdeputraw on 12/11/23.
//

import Foundation

extension TrendingMovieViewModel {
    
    func refreshPage() {
        self.getTrendingMovie(page: 1)
    }
    
    func loadNextPage() {
        guard let page = dataSource?.page else {
            return
        }
        
        self.getTrendingMovie(page: page + 1)
    }
}
