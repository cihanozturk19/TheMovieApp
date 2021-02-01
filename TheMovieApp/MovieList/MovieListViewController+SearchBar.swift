//
//  MovieListViewController+SearchBar.swift
//  TheMovieApp
//
//  Created by CİHAN ÖZTÜRK on 1.02.2021.
//  Copyright © 2021 CİHAN ÖZTÜRK. All rights reserved.
//

import Foundation
import UIKit

extension MovieListViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        if !searchText.isEmpty{
            interactor?.filterMovies(searchText: searchText)
        } else {
            interactor?.resetFilter()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        interactor?.resetFilter()
    }
}
