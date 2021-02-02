//
//  MovieListInteractor.swift
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

protocol MovieListBusinessLogic {
    func getPopularMovies(page: String)
    func getMovies()
    func didSelectItem(item: MovieList.PopularMovies.Results)
    func filterMovies(searchText: String)
    func resetFilter()
    func reloadData()
    func loadMore(indexPath: IndexPath)
}

protocol MovieListDataStore {
    var movieID: String? { get set }
    var selectedMovie: MovieList.PopularMovies.Results? { get set }
}

final class MovieListInteractor: MovieListBusinessLogic, MovieListDataStore {
    var presenter: MovieListPresentationLogic?
    var response: MovieList.PopularMovies.Response?
    var filterResponse: MovieList.PopularMovies.Response?
    var movieID: String?
    var selectedMovie: MovieList.PopularMovies.Results?
    var page: Int = 1
    
    func getPopularMovies(page: String) {
        
        let request = MovieList.PopularMovies.Request(requestURL: RequestURL.MovieList.popularMovies.url + page)
        ServiceAPI.shared.callService(request: request, response: MovieList.PopularMovies.Response.self) { (result) in
            
            switch result {
            case .success(let response):
                self.page = self.page + 1
                
                if page == "1" {
                    self.response = response
                    self.filterResponse = response
                } else {
                    self.response?.results?.append(contentsOf: response.results!)
                    self.filterResponse?.results?.append(contentsOf: response.results!)
                }
                
                self.presenter?.presentMovies(response: self.filterResponse!)
            case .failure(let error):
                debugPrint("Error \(error)")
            }
        }
    }
    
    func getMovies() {
        self.presenter?.presentMovies(response: response!)
    }
    
    func didSelectItem(item: MovieList.PopularMovies.Results) {
                
        if let movieID = item.id{
            self.movieID = String(movieID)
            self.selectedMovie = item
        }
        presenter?.presentDetail()
    }
    
    func filterMovies(searchText: String) {
        filterResponse?.results = response?.results?.filter({ $0.title?.range(of: searchText,
                                                                             options: [.caseInsensitive, .anchored]) != nil })
        presenter?.presentMovies(response: filterResponse!)
    }
    
    func resetFilter() {
        filterResponse = response
        presenter?.presentMovies(response: filterResponse!)
    }
    
    func reloadData() {
        
        for index in 0..<(filterResponse?.results)!.count {
            if filterResponse?.results![index].id == selectedMovie?.id {
                filterResponse?.results![index].isFavorite = selectedMovie!.isFavorite
            }
        }
        presenter?.presentMovies(response: filterResponse!)
    }
    
    func loadMore(indexPath: IndexPath) {
        guard let movies = filterResponse?.results, let totalPages = filterResponse?.total_pages else {
            return
        }
        let lastItem = movies.count - 1
        
        if indexPath.row == lastItem, page < totalPages {
            
            getPopularMovies(page: String(page))
        }
    }
}
