//
//  GenreViewModel.swift
//  MovieApp
//
//  Created by tutdeputraw on 16/11/23.
//

import Foundation

class GenreViewModel {
    static var shared: GenreViewModel = GenreViewModel()
    var genres: GenreResult?
    
    init () {
        getGenreList()
    }
    
    func getGenreList() {
        APICaller.getGenreList { result in
            switch result {
            case .success(let dataResult):
                self.genres = dataResult
                print("dataResult: \(dataResult)")
            case .failure(let errorResult):
                print("error: \(errorResult)")
            }
        }
    }
}
