//
//  MovieListViewModel.swift
//  TheMovieApp
//
//  Created by CİHAN ÖZTÜRK on 31.01.2021.
//  Copyright © 2021 CİHAN ÖZTÜRK. All rights reserved.
//

import Foundation
import UIKit

struct MovieListViewModel {

    var imageURL: String?
    var title: String?
    var isHiddenFavIcon: Bool = true
    
    init(imageURL: String?, title: String?, isHiddenFavIcon: Bool) {
        self.imageURL = "https://image.tmdb.org/t/p/w200" + (imageURL ?? "")
        self.title = title
        self.isHiddenFavIcon = isHiddenFavIcon
    }
}
