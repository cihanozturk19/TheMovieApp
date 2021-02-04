//
//  MovieListView.swift
//  TheMovieApp
//
//  Created by CİHAN ÖZTÜRK on 31.01.2021.
//  Copyright © 2021 CİHAN ÖZTÜRK. All rights reserved.
//

import Foundation
import UIKit

class MovieListView: BaseView {
    
    @IBOutlet private weak var movieImage: CustomImageView!
    @IBOutlet private weak var movieFavorite: UIImageView!
    @IBOutlet private weak var movieTitle: UILabel!
    
    var viewModel: MovieListViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            initView(viewModel: viewModel)
        }
    }
    
    func initView(viewModel: MovieListViewModel) {
        self.movieImage.loadImageWithUrl(viewModel.imageURL ?? "")
        self.movieFavorite.isHidden = viewModel.isHiddenFavIcon 
        self.movieTitle.text = viewModel.title
    }
}
