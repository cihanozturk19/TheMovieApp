//
//  MovieListModels.swift
//  TheMovieApp
//
//  Created by CİHAN ÖZTÜRK on 29.01.2021.
//  Copyright (c) 2021 CİHAN ÖZTÜRK. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum MovieList {
    
    // MARK: Use cases
    
    enum PopularMovies {
        
        struct Request: BaseRequest {
            var requestURL: String
        }
        
        struct Response : Codable {
            let page : Int?
            var results : [Results]?
            let total_pages : Int?
            let total_results : Int?
        }
        
        struct Results : Codable {
            let id : Int?
            let posterPath : String?
            let title : String?
            let voteCount : Int?
            var isFavorite: Bool = false
            
            private enum CodingKeys: String, CodingKey {
                case id
                case title
                case voteCount = "vote_count"
                case posterPath = "poster_path"
            }
            
            init() {
                self.id = 0
                self.title = ""
                self.voteCount = 0
                self.posterPath = ""
                self.isFavorite = false
            }
        }
        
        
        struct ViewModel {
            let page : Int?
            let results : [Results]?
            let total_pages : Int?
            let favoriteMoviesID: [Int] = DataPersistence.fetchFavorites()
        }
    }
}
