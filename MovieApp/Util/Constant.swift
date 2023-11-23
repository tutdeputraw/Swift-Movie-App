//
//  Constant.swift
//  MovieApp
//
//  Created by tutdeputraw on 11/11/23.
//

import Foundation

public class Constant {
    
    struct API {
        static let BEARER_TOKEN = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjYzMxMzFlZjA2MTQ2MWFhMWFhODk0OWRmYzQyODEzMSIsInN1YiI6IjYxYWRhMGM5NjJlODZmMDA4ZjNlMGRlMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.CKFDYjESYdbVNRuntRn4rkpihjbv8hiWeyBNg13Rlwo"
        
        static let API_KEY = "cc3131ef061461aa1aa8949dfc428131"
        
        static let BASE_URL = "https://api.themoviedb.org/3/"
        
        static let IMAGE_NETWORK = "https://image.tmdb.org/t/p/w500/"
    }
    
    struct LocalStorage {
        static var valmovieIds = "movieIds"
    }
}
