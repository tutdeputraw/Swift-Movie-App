//
//  SearchMovieViewModel.swift
//  MovieApp
//
//  Created by tutdeputraw on 12/11/23.
//

import Foundation
import UIKit

class SearchMovieViewModel {
    var appState: Observable<AppState> = Observable(nil)
    let searchController = UISearchController()
    var searchedMovies: TrendingMovieModel?
    var timer: Timer?
}
