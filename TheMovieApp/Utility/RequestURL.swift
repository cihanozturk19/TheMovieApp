//
//  RequestURL.swift
//  TheMovieApp
//
//  Created by CİHAN ÖZTÜRK on 30.01.2021.
//  Copyright © 2021 CİHAN ÖZTÜRK. All rights reserved.
//

import Foundation

enum RequestURL {
    
    enum Base: String {
        case baseURL = "https://api.themoviedb.org/3"
        var url: String {
            return self.rawValue
        }
    }
    
    enum RequestSettings: String {
        case apiKey = "&api_key=fd2b04342048fa2d5f728561866ad52a"
        case language = "language=en-US"
        case page = "&page="
    }
    
    enum MovieList: String {
        case popularMovies = "/movie/popular?&"
        
        var url: String {
            return Base.baseURL.url + self.rawValue +
                RequestSettings.language.rawValue +
                RequestSettings.apiKey.rawValue +
                RequestSettings.page.rawValue
        }
    }
    
    enum MovieDetail: String {
        //https://api.themoviedb.org/3/movie/775996?language=en-US&api_key=fd2b04342048fa2d5f728561866ad52a
        case detail = "movie/#?"
        
        var url: String {
            return Base.baseURL.url + self.rawValue +
            RequestSettings.language.rawValue +
            RequestSettings.apiKey.rawValue
        }
    }
}
