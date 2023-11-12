//
//  GetMovieBySearchKeyword.swift
//  MovieApp
//
//  Created by tutdeputraw on 12/11/23.
//

import Foundation

extension SearchMovieViewModel {
    
    func getMoviesBySearchKeyword(_ searchKeyword: String, page: Int = 1) {
        APICaller.searchMovie(page: page, searchKeyword: searchKeyword) { result in
            switch result {
            case .success(let data):
                page == 1 ? self.searchedMovies = data : self.appendDataSource(data)
                self.appState.value = .OnSuccess
            case .failure(let error):
                print(error)
                self.appState.value = .OnError(message: error.localizedDescription)
            }
        }
    }
    
    private func appendDataSource(_ newData: TrendingMovieModel) {
        self.searchedMovies?.results.append(contentsOf: newData.results)
        self.searchedMovies?.page = newData.page
        self.searchedMovies?.totalPages = newData.totalPages
        self.searchedMovies?.totalResults = newData.totalResults
    }
}
