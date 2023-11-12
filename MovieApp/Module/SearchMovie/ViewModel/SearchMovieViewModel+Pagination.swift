//
//  SearchMovieViewModel+Pagination.swift
//  MovieApp
//
//  Created by tutdeputraw on 12/11/23.
//

import Foundation

extension SearchMovieViewModel {
    
    func refreshPage() {
        guard let searchKeyword = getSearchedKeyword() else {
            return
        }
        getMoviesBySearchKeyword(searchKeyword)
    }
    
    func loadNextPage() {
        guard let searchKeyword = getSearchedKeyword() else {
            return
        }
        guard let page = searchedMovies?.page else {
            return
        }
        
        getMoviesBySearchKeyword(searchKeyword, page: page + 1)
    }
}
