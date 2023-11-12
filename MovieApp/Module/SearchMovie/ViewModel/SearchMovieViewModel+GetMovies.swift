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
//                print("top trending count: \(data.results.count)")
                if page == 1 {
                    self.searchedMovies = data
                } else {
                    self.appendDataSource(data)
                }
                self.appState.value = .OnSuccess
            case .failure(let error):
                print(error)
                self.appState.value = .OnError(message: error.localizedDescription)
            }
        }
//        print("searchKeyword \(self.searchedMovies?.results.count)")
    }
    
    private func appendDataSource(_ newData: TrendingMovieModel) {
//        print("dataSource: \(self.searchedMovies?.results.first?.title) | \(newData.results.first?.title)")
        self.searchedMovies?.results.append(contentsOf: newData.results)
        self.searchedMovies?.page = newData.page
        self.searchedMovies?.totalPages = newData.totalPages
        self.searchedMovies?.totalResults = newData.totalResults
    }
}
