//
//  MovieListViewCell.swift
//  TheMovieApp
//
//  Created by CİHAN ÖZTÜRK on 31.01.2021.
//  Copyright © 2021 CİHAN ÖZTÜRK. All rights reserved.
//

import Foundation
import UIKit

class MovieListViewCell: UICollectionViewCell, ReuseIdentifying {
    
    @IBOutlet private weak var movieListView: MovieListView!
    
    var moviewListViewModel: MovieListViewModel? {
        didSet {
            movieListView!.viewModel = moviewListViewModel
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
