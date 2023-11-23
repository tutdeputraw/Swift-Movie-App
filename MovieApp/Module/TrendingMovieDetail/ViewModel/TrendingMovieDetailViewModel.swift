//
//  TrendingMovieDetailViewModel.swift
//  MovieApp
//
//  Created by tutdeputraw on 12/11/23.
//

import Foundation

class TrendingMovieDetailViewModel {
    init() {
        getGenreList()
    }
    
    func saveToBookmark(movieId: Int) {
        let defaults = UserDefaults.standard
        
        var movieIds: [Any]? = defaults.array(forKey: Constant.LocalStorage.valmovieIds)
        if movieIds == nil {
            movieIds = []
        }
        
        movieIds?.append(movieId)
        
        defaults.set(movieIds, forKey: Constant.LocalStorage.valmovieIds)
    }
    
    func getGenreNameById(genreIds: [Int]) {
        let genreViewModel = GenreViewModel.shared
        let genres = genreViewModel.genres?.genres
        
        var genreName: [String] = []
        
//        for var genreId = 0; genreId <
    }
    
    func getGenreList() {
//        APICaller.getGenreList { result in
//            switch result {
//            case .success(let dataResult):
//                print("dataResult: \(dataResult)")
//            case .failure(let errorResult):
//                print("error: \(errorResult)")
//            }
//        }
    }
}
