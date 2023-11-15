//
//  GetTrendingMovie.swift
//  MovieApp
//
//  Created by tutdeputraw on 11/11/23.
//

import Foundation

extension TrendingMovieViewModel {
    func getTrendingMovie(page: Int = 1) {
//        appState.value = .OnLoading
        
        APICaller.getTrendingMovies(page: page) { result in
            switch result {
            case .success(let data):
                page == 1 ? self.dataSource = data : self.appendDataSource(data)
                self.appState.value = .OnSuccess
            case .failure(let error):
                print(error)
                self.appState.value = .OnError(message: error.localizedDescription)
            }
        }
    }
    
    private func appendDataSource(_ newData: TrendingMovieModel) {
        self.dataSource?.results.append(contentsOf: newData.results)
        self.dataSource?.page = newData.page
        self.dataSource?.totalPages = newData.totalPages
        self.dataSource?.totalResults = newData.totalResults
    }
}
