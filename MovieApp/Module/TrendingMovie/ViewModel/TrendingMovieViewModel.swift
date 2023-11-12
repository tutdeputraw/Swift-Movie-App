//
//  TrendingMovieViewModel.swift
//  MovieApp
//
//  Created by tutdeputraw on 11/11/23.
//

import Foundation

class TrendingMovieViewModel {
    var appState: Observable<AppState> = Observable(nil)
    var dataSource: TrendingMovieModel?
}
