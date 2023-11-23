//
//  APICaller.swift
//  MovieApp
//
//  Created by tutdeputraw on 11/11/23.
//

import Foundation

public class APICaller {
    
    static func getGenreList(
        completionHandler: @escaping (_ result: Result<GenreResult, NetworkError>) -> Void
    ) {
        let urlString = "\(Constant.API.BASE_URL)genre/movie/list?language=en"
        print("urlString: \(urlString)")
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.urlError))
            return
        }
        
        var request = URLRequest(url: url)
//        request.setValue("Authorization", forHTTPHeaderField: "Bearer \(Constant.API_KEY)")
        request.setValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjYzMxMzFlZjA2MTQ2MWFhMWFhODk0OWRmYzQyODEzMSIsInN1YiI6IjYxYWRhMGM5NjJlODZmMDA4ZjNlMGRlMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.CKFDYjESYdbVNRuntRn4rkpihjbv8hiWeyBNg13Rlwo", forHTTPHeaderField: "Authorization")
//        request.setValue("Authorization", forHTTPHeaderField: "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjYzMxMzFlZjA2MTQ2MWFhMWFhODk0OWRmYzQyODEzMSIsInN1YiI6IjYxYWRhMGM5NjJlODZmMDA4ZjNlMGRlMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.CKFDYjESYdbVNRuntRn4rkpihjbv8hiWeyBNg13Rlwo")
//        request.set

        URLSession.shared.dataTask(with: request) { dataResponse, urlResponse, error in
            print("RESRESULT" + String(data: dataResponse!, encoding: .utf8)!)
            if error == nil,
               let data = dataResponse,
               let resultData = try? JSONDecoder().decode(GenreResult.self, from: data) {
                completionHandler(.success(resultData))
            } else {
                completionHandler(.failure(.cannotParseData))
            }
        }.resume()
    }
    
    static func getTrendingMovies(
        page: Int,
        completionHandler: @escaping (_ result:Result<TrendingMovieModel,NetworkError>) -> Void
    ) {
        let urlString = "\(Constant.API.BASE_URL)trending/movie/day?api_key=\(Constant.API.API_KEY)&page=\(page)"
        print("urlString: \(urlString)")
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.urlError))
            return
        }
        
//        var request = URLRequest(url: url)
//        request.setValue("Authorization", forHTTPHeaderField: "Bearer \(Constant.API_KEY)")
//
//
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
            print("RESRESULT" + String(data: dataResponse!, encoding: .utf8)!)
            if error == nil,
               let data = dataResponse,
               let resultData = try? JSONDecoder().decode(TrendingMovieModel.self, from: data) {
                completionHandler(.success(resultData))
            } else {
                completionHandler(.failure(.cannotParseData))
            }
        }.resume()
    }
    
    static func searchMovie(
        page: Int,
        searchKeyword: String,
        completionHandler: @escaping (_ result:Result<TrendingMovieModel,NetworkError>) -> Void
    ) {
        let urlString = "\(Constant.API.BASE_URL)search/movie?api_key=\(Constant.API.API_KEY)&page=\(page)&query=\(searchKeyword)"
        print("urlString: \(urlString)")
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
            print("SEARCHRESULT" + String(data: dataResponse!, encoding: .utf8)!)
            if error == nil,
               let data = dataResponse,
               let resultData = try? JSONDecoder().decode(TrendingMovieModel.self, from: data) {
                completionHandler(.success(resultData))
            } else {
                completionHandler(.failure(.cannotParseData))
            }
        }.resume()
    }
}
