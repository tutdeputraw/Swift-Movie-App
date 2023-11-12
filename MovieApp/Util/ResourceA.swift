//
//  Resource.swift
//  MovieApp
//
//  Created by tutdeputraw on 11/11/23.
//

import Foundation

enum Resource<T> {
    case Success(data: T)
    case Error(message: String, data: T? = nil)
    case Loading
}

enum AppState {
    case OnSuccess
    case OnLoading
    case OnError(message:String)
}
