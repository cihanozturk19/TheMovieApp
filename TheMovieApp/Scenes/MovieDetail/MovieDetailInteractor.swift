//
//  MoviewDetailInteractor.swift
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

protocol MovieDetailBusinessLogic {
    func getDetail()
    func favoriteStatus()
    func changeFavoriteStatus()
}

protocol MovieDetailDataStore {
    var movieID: String? { get set }
    var selectedMovie: MovieList.PopularMovies.Results? { get set }
}

final class MovieDetailInteractor: MovieDetailBusinessLogic, MovieDetailDataStore {
    var presenter: MovieDetailPresentationLogic?
    var movieID: String?
    var selectedMovie: MovieList.PopularMovies.Results?
    
    func getDetail() {
        let request = MovieDetail.Request(requestURL:
            RequestURL.MovieDetail.detail.url.replacingOccurrences(of: "#",
                                                                   with: movieID ?? ""))

        ServiceAPI.shared.callService(request: request, response: MovieDetail.Response.self) { (result) in
            
            switch result {
            case .success(let response):
                self.presenter?.presentDetail(response: response)
                print(response)
            case .failure(let error):
                print("the error \(error)")
            }
        }
    }
    
    func favoriteStatus() {
        selectedMovie?.isFavorite.toggle()
        changeFavoriteStatus()
    }
    
    func changeFavoriteStatus() {
        guard let movie = selectedMovie else {
            return
        }
        if movie.isFavorite {
            DataPersistence.addFavorite(moveId: movie.id!)
        } else {
            DataPersistence.removeFavorite(moveId: movie.id!)
        }
        presenter?.presentFavoriteButton(isFavorite: movie.isFavorite)
    }
    
}