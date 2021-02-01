//
//  MovieListPresenter.swift
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

protocol MovieListPresentationLogic {
    func presentMovies(response: MovieList.PopularMovies.Response)
    func presentDetail()
}

final class MovieListPresenter: MovieListPresentationLogic {
    weak var viewController: MovieListDisplayLogic?
    
    func presentMovies(response: MovieList.PopularMovies.Response) {
        let viewModel = MovieList.PopularMovies.ViewModel(page: response.page,
                                                          results: response.results,
                                                          total_pages: response.total_pages)
        viewController?.displayMovies(viewModel: viewModel)
    }
    
    func presentDetail() {
        viewController?.displayDetail()
    }
}
