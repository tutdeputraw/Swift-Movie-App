//
//  SavedMovieViewModel.swift
//  MovieApp
//
//  Created by tutdeputraw on 15/11/23.
//

import Foundation

class SavedMovieViewModel {
    func getSavedMovieIds () -> [Int] {
        let defaults = UserDefaults.standard
        return defaults.array(forKey: Constant.LocalStorage.valmovieIds) as? [Int] ?? []
    }
    
    func getMoviesById() {
        let movieIds = getSavedMovieIds()
        
    }
}
        
