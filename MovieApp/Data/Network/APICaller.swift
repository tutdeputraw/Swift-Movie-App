//
//  APICaller.swift
//  MovieApp
//
//  Created by tutdeputraw on 11/11/23.
//

import Foundation

public class APICaller {
    static func getTrendingMovies(
        page: Int,
        completionHandler: @escaping (_ result:Result<TrendingMovieModel,NetworkError>) -> Void
    ) {
        let urlString = "\(Constant.BASE_URL)trending/movie/day?api_key=\(Constant.API_KEY)&page=\(page)"
        print("urlString: \(urlString)")
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.urlError))
            return
        }
        
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
        let urlString = "\(Constant.BASE_URL)search/movie?api_key=\(Constant.API_KEY)&page=\(page)&query=\(searchKeyword)"
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
